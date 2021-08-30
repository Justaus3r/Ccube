 # <img src="assets/nim_logo.png" width="42px" height="32px"/>  C^³(Ccube)

![language](https://badgen.net/badge/Language/Nim/yellow)
![semver](https://badgen.net/badge/Semantic-Version/1.0.0/purple)

A small and very simple nim program to validate Collatz conjecture.it can do some good stuff like validate collatz conjecture for indivisual number as well validate numbers in a loop. 

### So what the hell is collatz conjecture:
Copllatz conjecture is a mathematical conjecture that concerns to following sequence:
- Take any positive number.if its an odd number then multiply it with 3 and add 1 to add.i.e 3x+1 where x is that number.if its an even number then divide it by 2 .then take the answer and repeat these steps,no matter what, the sequence will always reduce to 1.

The problem is that we don't know that if this conjecture is true for every positive integer.

Collatz conjecture is one of the [unsolved](https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_mathematics) mathematical problem.for more information about collatz conjecture check out [wikipedia](https://en.wikipedia.org/wiki/Collatz_conjecture).

### And what can ccube do for me:
Well it can do some good things for you.it can
- Look up for every number to check for collatz conjecture and also check the number of iterations it took fot that number to reduce to 1.
- Saves all the checked numbers to a file.
- A json config to customize configuration
- Resume from a given number.

### On which Os will it work:
On all operating systems.

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
```

### Build from source:
**Build requirements:**
- Nim(advised to use latest version)
To build it from scource.simply: 
- Clone this repository and cd to the folder.
- Build it using ```nim c ccube.nim```.if you want to gain optimal speed then use ```-d:danger``` switch which disables all the runtime checks,for more [info](https://nim-lang.org/faq.html).

### Download:
You can download the zip named ```ccube.zip``` from [Release](https://github.com/Justaus3r/Ccube/releases/tag/v0.1.0) page.

### Future Update:
Who knows...

### Credits:
The icon for the executable is taken from [flaticon](https://www.flaticon.com/free-icon/function_1774103).credits for the icon goes to the author.

## Changelog:
All notable changes to this project will be documented in this file. Dates are displayed in UTC.

[0.1.2](https://github.com/Justaus3r/Ccube/releases/tag/v0.1.2)
>> 17 August 2021
- Fix various bugs and typos

[0.1.1](https://github.com/Justaus3r/Ccube/releases/tag/v0.1.0)
>> 31 July 2021
- Initial version

### License:
Distributed under General public license version3(GPLV3).anyone is permitted to use,redistribute,modify the source code.this program is distributed in the hope that it will be useful,but WITHOUT ANY WARRANTY.

