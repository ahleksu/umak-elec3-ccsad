# Pt1 Navigation and file operations
pwd
ls -la
mkdir practice_cli
cd practice_cli
touch notes.txt
echo "Hello Linux" > notes.txt
echo "Learning CLI is fun!" >> notes.txt
cat notes.txt

# Pt2 File and directory management
cp notes.txt backup_notes.txt
mv backup_notes.txt notes_backup.txt
mkdir docs
mv notes_backup.txt docs/

# Pt3 Permissions
ls -l notes.txt
chmod u+x notes.txt
chmod o-w notes.txt
ls -l notes.txt

# Pt 4 Process and system info
whoami
date
ps aux
pgrep bash

# Pt 5 Cleanup
cd ..
rm -r practice_cli
