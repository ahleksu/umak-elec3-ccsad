#!/usr/bin/env bash

#part1

pwd
ls -la
mkdir practice_cli
cd practice_cli
touch notes.txt
echo "Hello Linux" > notes.txt
echo "Learning CLI is fun!" >> notes.txt
cat notes.txt


#part2
cp notes.txt backup_notes.txt
mv backup_notes.txt notes_backup.txt
mkdir docs
mv notes_backup.txt docs/

#part3
ls -l notes.txt
chmod u+x notes.txt
chmod o-w notes.txt
ls -l notes.txt

#part4
whoami
date
ps aux
pgrep bash

#part5
cd ..
rm -r practice_cli
