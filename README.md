 # <img src="assets/nim_logo.png" width="42px" height="32px"/>  C^³(Ccube)

![language](https://badgen.net/badge/Language/Nim/yellow)
![semver](https://badgen.net/badge/Semantic-Version/1.0.0/purple)

A small and very simple Nim program to validate Collatz conjecture. It can validate the Collatz conjecture for individual numbers as well as validate numbers in a loop. 

**This program was originally programmed in Python. You can check out the Python port at the [ccube-python](https://github.com/Justaus3r/Ccube/tree/ccube-python) branch.**

### So what the hell is Collatz conjecture:
Collatz conjecture is a mathematical conjecture that concerns to the following sequence:
- Take any positive number. If it's an odd number, multiply it by 3 and add 1, i.e 3x+1 where x is that number. If it's an even number, divide it by 2, then take the answer and repeat these steps. No matter what positive number you start with, the sequence will always reduce to 1.

The problem is that we don't know if this conjecture is true for every positive integer.

Collatz conjecture is one of the [unsolved](https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_mathematics) mathematical problems. For more information about it check out [Wikipedia](https://en.wikipedia.org/wiki/Collatz_conjecture).

### And what can ccube do for me?
Well, it can do some good things for you. It can:
- Look up for every number to check for Collatz conjecture and also check the number of iterations it took for that number to reduce to 1.
- Ability to save all the checked numbers to a file.
- A JSON file to save configuration.
- Ability to resume from a given number.
- Show time taken for number to reduce to 1 in micro-seconds.
- Arbitrary precision integers aka bigints are used, so that the numbers are only limited by the amount of your RAM. You can validate ridiculously large numbers for the Collatz conjecture if you have enough memory.

### Download:
|<img src="https://img.icons8.com/windows/32/4a90e2/windows-10.png"/>|<img src="https://img.icons8.com/windows/32/fa314a/mac-os.png"/>|<img src="https://img.icons8.com/windows/32/26e07f/debian.png"/>|
|---|---|---|
| [ccube-v1.0.0-win.zip](https://github.com/Justaus3r/Ccube/releases/download/v1.0.0/ccube-v1.0.0-win.zip)| [ccube-v1.0.0-mac.zip](https://github.com/Justaus3r/Ccube/releases/download/v1.0.0/ccube-v1.0.0-mac.zip)| [ccube-v1.0.0-linux.zip](https://github.com/Justaus3r/Ccube/releases/download/v1.0.0/ccube-v1.0.0-linux.zip) |

**Note:** if you want to use this program on Andoid,then
- First install [Termux](https://termux.com/).
- install nim and git using ```pkg install nim git```
- clone the repo and cd to it.
- now compile it using ```nim c ccube.nim```

### Usage:
```
░█████╗░░█████╗░██╗░░░██╗██████╗░███████╗
██╔══██╗██╔══██╗██║░░░██║██╔══██╗██╔════╝
██║░░╚═╝██║░░╚═╝██║░░░██║██████╦╝█████╗░░
██║░░██╗██║░░██╗██║░░░██║██╔══██╗██╔══╝░░
╚█████╔╝╚█████╔╝╚██████╔╝██████╦╝███████╗
░╚════╝░░╚════╝░░╚═════╝░╚═════╝░╚══════╝Version1.0.0

Usage:ccube <ARGS>
Note:These arguments are not positional,
meaning you can use them in any order.

ARGUMENTS:
--noloop:<true/false> | A boolean to check if to loop through 
                      | next numbers.
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
                      | default filename is 'iterationData.txt'
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

```
### Using a custom config:
You can use a custom json file named ```ccube_config.json``` to store configs for ccube,i.e:
```json
{
 "noLoopSwitch":true,
 "number":"69",
 "filePath":"void"
}
```
you can change the values to your need.

**Note: Don't remove any of the keys (noLoopSwitch or others) or your config won't work** 

### Building from source
**Build requirements:**
- Nim (use the latest version for the best results)

To build it from source, simply: 
- Clone this repository and cd to the folder.
- Run ```nim c ccube.nim```. If you want to have the best performance then use `-d:danger` switch which disables all the runtime checks, for more info see [the Nim FAQ](https://nim-lang.org/faq.html). 

### Additional performance flags 
If your Nim version is 1.4.0 or higher, you can compile using `-d:danger --gc:orc` which is even faster.
Also, if you don't mind longer compile times, you can use link-time optimization: `nim c -d:danger --gc:orc -d:lto ccube.nim`.


### Future updates
Who knows...

### Contributions
Feel free to contribute 😀.

### Credits
The Nim logo is taken from [here](https://icon-icons.com/icon/file-type-nim/130304).credits for the icon goes to the author.

## Changelog
All notable changes to this project will be documented in this file. Dates are displayed in UTC.

[1.0.0](https://github.com/Justaus3r/Ccube/releases/tag/v1.0.0)
>> 31 August 2021

Major Release:
- Project ported from python to nim.
- Now ridiculously faster than before.
- Very light weight,about 100 kbs in size.
- you can add a custom json file named ```ccube_config.json```.
- you can validate collatz conjecture for individual numbers.

[0.1.2](https://github.com/Justaus3r/Ccube/releases/tag/v0.1.2)
>> 17 August 2021
- Fix various bugs and typos

[0.1.1](https://github.com/Justaus3r/Ccube/releases/tag/v0.1.0)
>> 31 July 2021
- Initial version

### License:
Distributed under General public license version3(GPLV3).anyone is permitted to use,redistribute,modify the source code.this program is distributed in the hope that it will be useful,but WITHOUT ANY WARRANTY.

