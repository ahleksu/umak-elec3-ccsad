#!/usr/bin/env bash

# Part 1


#1
pwd

#2
ls -la

#3
mkdir practice_cli

#4
cd practice_cli

#5
touch notes.txt

#6
echo "Hello Linux" > notes.txt

#7
echo "Learning CLI is fun!" >> notes.txt

#8
cat notes.txt

#part 2

#9
cp notes.txt backup_notes.txt

#10
mv backup_notes.txt notes_backup.txt

#11
mkdir docs
mv notes_backup.txt docs/

#Part 3

#12
ls -l notes.txt

#13
chmod u+x notes.txt

#14
chmod o-w notes.txt

#15
ls -l notes.txt

#Part 4

#16
whoami

#17
date

#18
ps aux

#19
pgrep bash

#Part 5
cd ~
rm -r practice_cli
