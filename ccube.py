'''
ccube - collatz conjucture check by justaus3r

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
    '''
import sys
from rich import print


def odd_or_even(number):
    if number % 2 == 0:
        return 'even'
    else:
        return 'odd'    
try:
    num = int(sys.argv[1])
except IndexError:
    try:
        with open("_resume_iter.txt","r") as read_iter:
            num = int(read_iter.read())
    except Exception:
        num = 1
notstopped = True
no_of_iter = 0

def ccube():
    try:
        global num
        global notstopped
        global no_of_iter        
        while notstopped:
            try:
                numcopy = num
                while num != 1:                 
                    if odd_or_even(num) == 'odd':
                        num = (3 * num) + 1                
                    elif odd_or_even(num) == 'even':
                        num = num // 2                 
                    no_of_iter += 1    
                else:
                    with open("_ccube_data_per_no_.txt","a") as write_iter_data:
                        write_iter_data.write(f"Current Number:{numcopy}\n")
                        write_iter_data.write(f"Number of iterations:{no_of_iter}\n")
                        write_iter_data.write("==============================================================\n")

                    print(f"[green]Current Number[/green][blue]:[/blue][cyan]{numcopy}[/cyan]")
                    print(f"[green]Number of iterations[/green][blue]:[/blue][cyan]{no_of_iter}[/cyan]") 
                    print("[purple]=================================================================[/purple]")   
                    numcopy += 1
                    num = numcopy
                    no_of_iter = 0
                
                    
            except KeyboardInterrupt:
                print("[red]Interruped!,Aborting[/red]")
                notstopped = False
    except Exception as ex:
        print(f"[red]Oho!.it seems that i could only run this much.\nFollowing error has occured while i was running:\n{ex}[/red]")

ccube()
sys.exit()
