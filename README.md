# TARS - Trettel's Auto Rice Script

Here lies all my config files that are a pain in the ass to configure from scratch, so I created an auto rice script to build all of then.

If you want to use this script with your config and programs, follow the instructions.

## Usage
```sh
./TARS.py -c <path_configs> -i <pkg.list>
```
Where <path_config> is a folder with all yours config files, and <pkg.list> is a file for installing stuff. The -c and -i args are independent, so if your goal is just move files, omit -i flag.

### Tips
 - For everything works correctly while moving your files, you must put the final directory in the first 5 lines (for each file) in this format:
```
# location : /home/foo/bar/example.txt
```
You can use any comment character that you want, the important here is write "location" and put the full path after ':'

 - The file who install programs is simple and an example can be found [here](https://github.com/GabrielTrettel/TARS/blob/master/files/pkgs.list). All lines are executed by its closest command above, starting by a "\#".
```
# sudo pacman -S
pkg1
pkg2
pkg3
```
Will be parsed and runned as ```sudo pacman -S pkg1 pkg2 pkg3```, because `pacman` accepts several pkgs in one line. Same as `trizen`, `yay`, `apt`. But, for all other lines, like this:
```
# git clone
repo1 src_destination1
repo2 src_destination2
repo3 src_destination3
```
Will be parsed and runned individually, like
```
git clone repo1 src_destination1
git clone repo2 src_destination2
git clone repo3 src_destination3
```
