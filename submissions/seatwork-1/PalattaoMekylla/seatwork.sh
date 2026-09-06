#!/usr/bin/env bash
echo "=== Part 1 — Navigation & File Operations ==="
echo "Task 1: Current working directory"
pwd
echo ""
echo "Task 2: List all files in long format"
ls -la
echo ""
echo "Task 3: Create practice_cli directory"
mkdir practice_cli
echo ""
echo "Task 4: Move into practice_cli"
cd practice_cli
echo ""
echo "Task 5: Create empty notes.txt"
touch notes.txt
echo ""
echo "Task 6: Write 'Hello Linux' into notes.txt"
echo "Hello Linux" > notes.txt
echo ""
echo "Task 7: Append 'Learning CLI is fun!' to notes.txt"
echo "Learning CLI is fun!" >> notes.txt
echo ""
echo "Task 8: Display contents of notes.txt"
cat notes.txt
echo ""



echo "=== Part 2 — File & Directory Management ==="
echo "Task 9: Copy notes.txt to backup_notes.txt"
cp notes.txt backup_notes.txt
echo ""

echo "Task 10: Rename backup_notes.txt to notes_backup.txt"
mv backup_notes.txt notes_backup.txt
echo ""


echo "Task 11: Create docs and move notes_backup.txt into it"
mkdir docs
mv notes_backup.txt docs/
echo ""

echo "=== Part 3 — Permissions ==="
echo "Task 12: View permissions for notes.txt"
ls -l notes.txt
echo ""

echo "Task 13: Give owner execute permission"
chmod u+x notes.txt
echo ""

echo "Task 14: Remove write permission for others"
chmod o-w notes.txt
echo ""

echo "Task 15: Checkpoint — show permissions after changes"
ls -l notes.txt
echo "-rwxr--r--"
echo ""

echo "=== Part 4 — Process & System Info ==="

echo "Task 16: Current logged-in user"
whoami
echo ""

echo "Task 17: Current date and time"
date
echo ""

echo "Task 18: Running processes"
ps aux
echo ""

echo "Task 19: Process ID of bash"
pgrep bash 2>/dev/null || ps -ef | grep bash | grep -v grep | head -1 | awk '{print $2}'

echo ""

echo "=== Part 5 — Cleanup ==="
echo "Task 20: Remove practice_cli and everything in it"
cd ~
rm -r practice_cli
echo ""

