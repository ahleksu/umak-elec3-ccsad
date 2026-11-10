#!/usr/bin/env bash

# Part 1 — Navigation & File Operations
pwd
ls -la
mkdir practice_cli
cd practice_cli
touch notes.txt
echo "Hello Linux" > notes.txt
echo "Learning CLI is fun!" >> notes.txt
cat notes.txt

# Part 2 — File & Directory Management
cp notes.txt backup_notes.txt
mv backup_notes.txt notes_backup.txt
mkdir docs
mv notes_backup.txt docs/

# Part 3 — Permissions
ls -l notes.txt
chmod u+x notes.txt
chmod o-w notes.txt
ls -l notes.txt

# Part 4 — Process & System Info
whoami
date
ps aux
pgrep bash

# Part 5 — Cleanup
cd ~
rm -r practice_cli
