#!/usr/bin/env bash

#PART 1
pwd

ls -la

mkdir practice_cli

cd practice_cli

touch notes.txt

echo "Hello Linux" > notes.txt

echo "Learning CLI is fun!" >> notes.txt

cat notes.txt

#PART 2
cp notes.txt backup_notes.txt

mv backup_notes.txt notes_backup.txt

mkdir docs
mv notes_backup.txt docs/

#PART 3
ls -l notes.txt

chmod u+x notes.txt

chmod o-w notes.txt

ls -l notes.txt

#PART 4
whoami

date

ps aux

pgrep bash

#PART 5
cd .. #I PUT THIS IN BECAUSE FOLDER IS NOT IN ROOT DIRECTORY
rm -r practice_cli