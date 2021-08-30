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
import std/[os,strutils,strformat,random,json]
import bigints

randomize()

let VER = "1.0.0"
let banner = fmt"""
░█████╗░░█████╗░██╗░░░██╗██████╗░███████╗
██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
██║░░╚═╝██║░░╚═╝██║░░░██║██████╦╝█████╗░░
██║░░██╗██║░░██╗██║░░░██║██╔══██╗██╔══╝░░
╚█████╔╝╚█████╔╝╚██████╔╝██████╦╝███████╗
░╚════╝░░╚════╝░░╚═════╝░╚═════╝░╚══════╝Version{VER}"""

proc showUsage():void =  
  echo(banner)
  echo("""

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
""")
  quit()

proc parseParams():(string,string,string) =
  if paramCount() > 0:
    var
      paramSequence:seq[string] = @[]
      forbiddenCharArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","!","@","#","$","%","^","&","*","(",")","_","-","=","+","'","\"",":",";","<",">",".","/","?","[","]","{","}"]
      validBools = ["true","false"]
      noLoopSwitch = "--noloop:"
      fileSwitch = "--file:"
      numberParam = "-n:"
      filePath:string
      number:string
      noLoopSwitchBool:string
    for i in 1..paramCount():
      paramSequence.add(paramStr(i))
    for param in paramSequence:
      if noLoopSwitch in param:
        try:
          noLoopSwitchBool = param.split(':')[1]
          if noLoopSwitchBool in validBools:
            discard
          else:
            stderr.write(&"Error:\"{noLoopSwitchBool}\",Invalid bool used")
            quit()
        except IndexDefect:
          stderr.write("Error:Bad use of --noloop switch,valid bool expected")
          quit()
      
      if numberParam in param:
        try:
          number = param.split(':')[1]
          for forbiddenChar in forbiddenCharArray:
            if forbiddenChar.toUpper in number or forbiddenChar.toLower in number:
              stderr.write(fmt"Error:Expected a valid integer but got '{number}',[Value Error]")
              quit()
        except IndexDefect:
          stderr.write("Error:Bad use of --noloop switch,valid integer expected")
          quit()
      
      if fileSwitch in param:
        try:
          filePath = param.split(':')[1]      
        except IndexDefect:
          stderr.write("Error:Bad use of --file switch,valid file path expected") 
          quit()
    
    if len(filePath) > 0:
      discard
    else:
      filePath = fmt"{getCurrentDir()}{DirSep}iterationData.txt"
    
    if len(number) > 0:
      discard
    else:
      number = $rand(1..1000)
    
    if len(noLoopSwitchBool) > 0:
      discard
    else:
      noLoopSwitchBool = "false"
    
    result = (noLoopSwitchBool,number,filePath)
  
  else:
    showUsage()

proc isEven(number:BigInt):bool =
  if number mod 2 == 0:
    result = true
  else:
    result = false

proc readJson():(string,string,string) =
  var isFile = fileExists("ccube_conf.json")
  if isFile:
    try:
      let
        readJsonData = readFile("ccube_conf.json")
        jsonNode = parseJson(readJsonData)
        noLoopSwitchBool = $jsonNode["noLoopSwitch"]
        number = $jsonNode["number"]
        filePath = $jsonNode["filePath"]
      result = (noLoopSwitchBool,number,filePath)
    except KeyError:
      stderr.write("Error:An error occured while reading json keys,Invalid Keys!\n")
      result = ("-1","-1","-1")
  else:
    result = ("-1","-1","-1")


proc main(cmdArgs:(string,string,string)):void = 
  var
    noLoopSwitchBool = cmdArgs[0].strip(chars = {'"'})   # strip " from string if exists
    number = initBigInt(cmdArgs[1].strip(chars = {'"'}))
    filePath = cmdArgs[2].strip(chars = {'"'})
    isLooping = true
    incrementer:BigInt
    noOfIterations:BigInt = initBigInt("0")
  while isLooping or noLoopSwitchBool == "false":
    incrementer = number
    while number != 1:
      if isEven(number):
        number = number div 2
        inc noOfIterations
      else:
        number = (number * 3) + 1
        inc noOfIterations

    var echoData = &"""-----------------------------------
Current Number:{incrementer}
Number of iterations:{noOfiterations}
-----------------------------------{'\n'}"""

    echo(echoData)
    if filePath == "void":
      discard
    else:
      try:
        let writeData = open(filePath,fmAppend)
        writeData.write(echoData)
        writeData.close
      except IOError as e:
        stderr.write(fmt"Error:An Error occured while writing data,{'\n'}{'\n'}Details:{e.msg}")
        quit()
    inc incrementer
    number = incrementer
    noOfIterations = initBigInt("0")
    if noLoopSwitchBool == "true":
      isLooping = false


if readJson() == ("-1","-1","-1"):
  main(parseParams())
else:
  main(readJson())


