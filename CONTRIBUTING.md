# Contributing

This repo is shared by everyone in the section. Follow the rules below so that
submissions don't collide with each other. They apply to every activity in this
repo — seatworks, labs, and assignments.

## Workflow: fork → branch → PR

1. Fork this repository to your own GitHub account.
2. Clone your fork and create a branch for your submission:
   ```bash
   git checkout -b <activity-id>-<your-name-or-group>
   # e.g. seatwork-1-jdelacruz, or lab-1-team-alpha
   ```
3. Work only inside your own folder (see below). A PR that touches any other file —
   someone else's submission, an activity brief, the CI workflow — will be closed
   without review.
4. Commit and push to your fork, then open a Pull Request against this repository's
   `main` branch.
5. Fill out the PR template completely. Once your PR is open and passing, submit its link to the post-activity Google Form I will provide.
6. Wait for the CI check on your PR. It re-checks your submission the same way you
   checked it locally. If it's red, read the log, fix the issue, and push again —
   the same PR updates automatically.

## Directory isolation — one rule for every activity

```
submissions/<activity-id>/<your-identifier>/
```

- `<activity-id>` matches the folder name under [`activities/`](activities/).
- `<your-identifier>` is your exact GitHub username for individual work, or your
  assigned group number for group work (e.g. `group-3`) — check the activity's own
  brief for which applies, and spell it identically every time. A group name is
  optional and, where used, goes inside your submission (e.g., in your incident report), not in
  the folder name.
Do not create files anywhere else in `submissions/`, and do not modify
`activities/`, `templates/`, or `.github/`.

## How your submission gets checked

If an activity's folder under `activities/<activity-id>/` contains a `check.sh`,
run it the same way CI will:

```bash
bash activities/<activity-id>/check.sh submissions/<activity-id>/<your-identifier>
```
Example:
```bash
bash activities/seatwork-1/check.sh submissions/seatwork-1/jdelacruz
```

One argument: your submission folder. It should print `PASS` and exit with code 0.
If an activity has no `check.sh`, it's graded manually.

## Commit conventions

```
seatwork-1: submit seatwork.sh
lab-1: submit case for group-3, brief 01-weather-relay-outage
```

## Academic integrity

For activities where the checker generates data specific to your name or group
(Lab Activity 1, for example), the scripts are public but your specific answer
isn't until you run them yourself with your own identifier. Copying someone else's
submission won't pass under your identifier. See your course's AI-use and
academic-integrity policy for what counts as acceptable assistance.

## Troubleshooting FAQs

**Q: `check.sh` is failing on Windows when running `pgrep` or `ps` commands.**  
**A:** `Git Bash` on Windows does not fully simulate Linux process trees. To ensure 100% compatibility, please use **Windows Subsystem for Linux (WSL)**. In WSL, your terminal will behave exactly as expected by the checkers.

**Q: The checker output says "permission denied".**  
**A:** If you created the shell script on Windows and transferred it, it may lack execution permissions. Run `chmod +x activities/<activity-id>/check.sh` before running it. Also ensure your own `seatwork.sh` scripts are made executable if required.

**Q: My PR failed the CI check, but it works on my machine.**  
**A:** Review the GitHub Actions logs on your PR to see the specific error. Common reasons include missing files, placing your submission in the wrong directory, or relying on something specific to your local machine that isn't present in the CI sandbox.

**Q: I get "Carriage Return (\r) character found" errors.**  
**A:** If you wrote your scripts using a Windows text editor (like Notepad), they might have Windows line endings (`CRLF`). Bash scripts require Unix line endings (`LF`). In VS Code, you can change CRLF to LF in the bottom right corner of the editor. Or you can run `dos2unix my-script.sh` in WSL.
