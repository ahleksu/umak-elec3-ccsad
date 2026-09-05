---
week: 3
graded: true
counts_toward: Midterm Class Standing — Seatwork/Assignment/Recitation (10%)
duration: 20 minutes
mode: Individual — submitted via Pull Request to this repository
coverage: Navigation, file/directory management, permissions, process/system info, cleanup (Week 3 lecture)
---

# Seatwork 1 — Linux CLI Fundamentals

A command-line practice checklist covering twenty tasks across five parts. Write one
script, `seatwork.sh`, that performs all of them in order, run it, and submit the
script plus its output.

## How to do this

1. Fork this repo and clone your fork.
2. Create a new empty folder to work in (anywhere outside a real project you care
   about — this script creates and deletes files).
3. Write `seatwork.sh` containing the commands for all 20 tasks below, in order,
   starting with `#!/usr/bin/env bash` on the first line.
4. Run it and read the output: `bash seatwork.sh`.
5. Copy `seatwork.sh` into `submissions/seatwork-1/<github_username>/` in your fork,
   open a PR, and let CI confirm it actually runs clean.

## Part 1 — Navigation & File Operations

1. Display the current working directory.
   ```bash
   pwd
   ```
2. List all files (including hidden ones) in long format.
   ```bash
   ls -la
   ```
3. Create a directory named `practice_cli`.
   ```bash
   mkdir practice_cli
   ```
4. Move into the `practice_cli` directory.
   ```bash
   cd practice_cli
   ```
5. Create an empty file named `notes.txt`.
   ```bash
   touch notes.txt
   ```
6. Write the text `"Hello Linux"` into `notes.txt`.
   ```bash
   echo "Hello Linux" > notes.txt
   ```
7. Append `"Learning CLI is fun!"` to `notes.txt`.
   ```bash
   echo "Learning CLI is fun!" >> notes.txt
   ```
8. Display the contents of `notes.txt`.
   ```bash
   cat notes.txt
   ```

## Part 2 — File & Directory Management

9. Copy `notes.txt` to `backup_notes.txt`.
   ```bash
   cp notes.txt backup_notes.txt
   ```
10. Rename `backup_notes.txt` to `notes_backup.txt`.
    ```bash
    mv backup_notes.txt notes_backup.txt
    ```
11. Create a subdirectory named `docs` and move `notes_backup.txt` into it.
    ```bash
    mkdir docs
    mv notes_backup.txt docs/
    ```

## Part 3 — Permissions

12. View file permissions for `notes.txt`.
    ```bash
    ls -l notes.txt
    ```
13. Give the owner execute permission for `notes.txt`.
    ```bash
    chmod u+x notes.txt
    ```
14. Remove write permission for others on `notes.txt`.
    ```bash
    chmod o-w notes.txt
    ```
15. **Checkpoint — show it worked.** Run `ls -l notes.txt` one more time and let it
    print. This is your only evidence that steps 13–14 actually changed anything, so
    don't skip it:
    ```bash
    ls -l notes.txt
    ```

## Part 4 — Process & System Info

16. Display the current logged-in user.
    ```bash
    whoami
    ```
17. Show the current date and time.
    ```bash
    date
    ```
18. Display running processes.
    ```bash
    ps aux
    ```
19. Find the process ID (PID) of `bash`.
    ```bash
    pgrep bash
    ```

## Part 5 — Cleanup

20. Go back to the directory you started from, then remove `practice_cli` and
    everything in it.
    ```bash
    cd ~
    rm -r practice_cli
    ```

## Scoring

- Part 1 (Navigation & File Ops): 5 points
- Part 2 (File & Directory Management): 4 points
- Part 3 (Permissions, including the checkpoint): 5 points
- Part 4 (Process & System Info): 4 points
- Part 5 (Cleanup): 2 points
- Total: 20 points, entered as one Seatwork 1 grade within the Seatwork/Assignment/Recitation
  component (10% of Midterm Class Standing).

## Submission

Open a Pull Request against this repository with your `seatwork.sh` at
`submissions/seatwork-1/<github_username>/seatwork.sh`.

Before opening the PR, do the exact same check CI will do:
```bash
bash activities/seatwork-1/check.sh submissions/seatwork-1/<github_username>
```
Example, for the GitHub username `jdelacruz`:
```bash
bash activities/seatwork-1/check.sh submissions/seatwork-1/jdelacruz
```
It runs your script in an isolated sandbox (your real files are never touched) and
checks that every part actually produced the expected output. A green CI check means
the same thing this printed locally: `PASS`. If CI is red, read the failure message,
fix your script, and push again.

**Final Step:** Once your PR is open and the CI check is green (passing), submit the link to your PR into the post-activity Google Form I will provide to receive your grade.
