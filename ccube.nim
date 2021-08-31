#[
  Nim remake of my python's ccube script that validates if a number follows collatz conjecture

Distributed under GPLV3
  This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]#
import std/[os, strutils, strformat, random, json, parseopt]
import bigints

randomize()

const VER = "1.0.0"
const banner = fmt"""
░█████╗░░█████╗░██╗░░░██╗██████╗░███████╗
██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
██║░░╚═╝██║░░╚═╝██║░░░██║██████╦╝█████╗░░
██║░░██╗██║░░██╗██║░░░██║██╔══██╗██╔══╝░░
╚█████╔╝╚█████╔╝╚██████╔╝██████╦╝███████╗
░╚════╝░░╚════╝░░╚═════╝░╚═════╝░╚══════╝Version:{VER}"""

proc showUsage =
  echo banner
  echo """

Usage:ccube <ARGS>
Note:These arguments are not positional,
meaning you can use them in any order.

ARGUMENTS:
--noloop:<true/false> | A boolean to check if next numbers 
                      | are to be validated for collatz conjecture.
                      | by default this boolean is false
                      |
-n:<number>           | Number to be checked for.if no number
                      | is given then a random number from
                      | 1 to 1000 is used.
                      |
--file:<Path>         | Path for the file in which result will
                      | be stored.if 'void' is specified then
                      | results wont be stored in file.
                      | default path is current directory.
                      | default filename is iterationData.txt
Examples:
  1:ccube --noloop:false -n:69 --file:void
  Above command will calculate cc for numbers
  onward from 68.no result will be stored.
  
  2:ccube -n:6969 --noloop:true 
  Above command will check cc for only current number.
  result is stored in samw directory with default
  filename.

  3:ccube -n:69 --noloop:false --file:/home/user/Desktop/pp.txt
  Above command will check cc for numbers
  onward from 68.results are stored in Desktop on 
  file name pp.txt.

  cc* = collatz conj
"""
  quit()


type
  ProgramArgs = object
    noLoopSwitch: bool
    number: string
    filePath: string

proc parseParams(): ProgramArgs =
  if paramCount() == 0:
    showUsage()
  
  var p = initOptParser()
  for kind, key, val in p.getopt():
    case kind
    of cmdEnd: break
    of cmdShortOption, cmdLongOption:
      case key
      of "noloop":
        try:
          result.noLoopSwitch = parseBool(val)
        except ValueError:
          stderr.write(fmt"Error: '{val}' is not a valid boolean value.")
          quit()
      of "n":
        for c in val:
          if c notin Digits:
            stderr.write(fmt"Error: '{val}' is not a valid number.")
            quit()
        result.number = val
      of "file":
        result.filePath = val
    else: discard

  if result.filePath.len == 0:
    result.filePath = getCurrentDir() / "iterationData.txt"

  if result.number.len == 0:
    result.number = $rand(1..1000)

proc isEven(number: BigInt): bool =
  result = number mod 2 == 0

proc readJson(): (ProgramArgs, bool) =
  var isFile = fileExists("ccube_config.json")
  if isFile:
    try:
      let args = parseFile("ccube_config.json").to(ProgramArgs)
      result = (args, true)
    except KeyError:
      stderr.write("An error occured while reading JSON configuration.")

proc doWork(args: ProgramArgs) =
  var
    number = initBigInt(args.number)
    isLooping = true
    incrementer: BigInt
    noOfIterations = initBigInt("0")
  
  while isLooping:
    incrementer = number
    while number != 1:
      if isEven(number):
        number = number div 2
      else:
        number = (number * 3) + 1
      inc noOfIterations

    var echoData = &"""-----------------------------------
Current number:{incrementer}
Number of iterations:{noOfiterations}
-----------------------------------{'\n'}"""

    echo echoData
    if args.filePath != "void":
      try:
        let writeData = open(args.filePath, fmAppend)
        writeData.write(echoData)
        writeData.close
      except IOError as e:
        stderr.write(&"An error occured while writing data.\n\nDetails: {e.msg}")
        quit()
    inc incrementer
    number = incrementer
    noOfIterations = initBigInt("0")
    if args.noLoopSwitch:
      isLooping = false

proc main = 
  var (jsonConf, jsonOk) = readJson()
  if jsonOk:
    echo "Read the configuration values from the JSON config."
    doWork(jsonConf)
  else:
    doWork(parseParams())

main()
