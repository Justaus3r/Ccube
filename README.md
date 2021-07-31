# Ccube

![language](https://badgen.net/badge/Language/Python/cyan)
![semver](https://badgen.net/badge/Semantic-Version/0.1.1/purple)

A small and very simple python script to check for Collatz conjecture.it can automatically save the current number on iteration upon abortion.also has the ability to resume the check from a given number.

### So what the hell is collatz conjecture:
Copllatz conjecture is a mathematical conjecture that concerns to following sequence:
- Take any positive number.if its an odd number then multiply it with 3 and add 1 to add.i.e 3x+1 where x is that number.if its an even number then divide it by 2 .then take the answer and repeat these steps,no matter what, the sequence will always reduce to 1.

The problem is that we don't know that if this conjecture is true for every positive integer.

Collatz conjecture is one of the [unsolved](https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_mathematics) mathematical problem.for more information about collatz conjecture check out [wikipedia](https://en.wikipedia.org/wiki/Collatz_conjecture).

### And what can ccube do for me:
Well it can do some good things for you.it can
- Look up for every number to check for collatz conjecture and also check the number of iterations it took fot that number to reduce to 1.
- Automatically saves all the checked numbers to a file.
- Saves the current number in a file upon abortion(only if aborted by keyboard interrupt)
- Resume from a given number.


### On which Os will it work:
On all operating systems.executables are only provided for windows tho.

### Usage:
[Download](https://github.com/Justaus3r/Ccube/releases/download/v0.1.0/ccube.zip) the zip file and extract it and simply run the executable.to stop it i would advise you to use ```ctrl + c``` on windows and ```ctrl + z``` on linux,the benefit for stopping like this is that your current number count will get save in a file(called save_curr_no.txt) and you can resume it later.for resuming there are two ways,either:
- Open cmd in as directory as the executable and  type ```ccube <the number you want to resume with>```(without <>).
- There is a file name ```_resume_iter.txt```.open it and paste the number that you want to resume with.now run the executable and it will resume from that count.

### Run from source:
For running from source.simply 
- Clone this repository and cd to the folder.
- There is only one dependency called rich.install it by using ```python -m pip install rich```.
- Run using ```python ccube.py```

### Download:
You can download the zip named ```ccube.zip``` from [Release](https://github.com/Justaus3r/Ccube/releases/tag/v0.1.0) page.

### Future Update:
Depends if it is useful then i might update it.but i don't plan to do that now.

### Credits:
The icon for the executable is taken from [flaticon](https://www.flaticon.com/free-icon/function_1774103).credits for the icon goes to the author.

### License:
Distributed under General public license version3(GPLV3).anyone is permitted to use,redistribute,modify the source code.this program is distributed in the hope that it will be useful,but WITHOUT ANY WARRANTY.

