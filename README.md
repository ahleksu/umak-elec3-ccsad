# ELEC3 Cloud Computing — CCSAD

This is the public submission repository for **CCSAD**, UMak CCIS ELEC3 (Cloud
Computing). Seatworks, lab activities, and assignments are posted here as they're
assigned, and you submit your work as a Pull Request.

## Environment Setup

These exercises assume a standard Bash/Linux environment. To make sure all students use the same commands and experience no compatibility issues:
- **Windows Users (Recommended):** Install **Windows Subsystem for Linux (WSL)** (e.g., Ubuntu). Open your WSL terminal to run `bash` and do your work there.
- **Windows Users (Alternative):** Install **Git for Windows** and use **Git Bash**. Note that some Linux-specific process commands (like `ps aux` or `pgrep`) might behave differently here, so WSL is strongly preferred.
- **MacOS / Linux Users:** Your native terminal (Terminal.app on Mac, or your standard Linux terminal) is already compatible. Just open it and run `bash` if you are using `zsh` by default.

## Quick start

1. **Fork this repository** (button, top right).
2. **Clone your fork:**
   ```bash
   git clone https://github.com/<your-github-username>/<this-repo-name>.git
   cd <this-repo-name>
   ```
3. **Find the current activity** under [`activities/`](activities/) — each one has its
   own brief (`.md` file) with full instructions.
4. **Do the work inside your own folder** under `submissions/<activity>/<your-name-or-group>/`
   — see [`CONTRIBUTING.md`](CONTRIBUTING.md) for the exact convention. This keeps
   everyone's submission isolated so 30–40 concurrent PRs don't collide.
5. **Open a Pull Request** back to this repository (not your fork's main branch —
   the PR template will guide you).
6. **Watch the CI check** on your PR. Green means it passed; red means read the
   log and fix it.

## What's here

This repo grows over the semester as new seatworks, labs, and assignments are added
under `activities/`. Check that folder directly for the full, current list; the
currently-active ones are:

| Path | What it is |
|---|---|
| [`activities/seatwork-1/`](activities/seatwork-1/) | Seatwork 1 — Linux CLI Fundamentals |
| [`activities/assignment-1/`](activities/assignment-1/) | Assignment 1 — Course Materials Portal: Diagnose, Fix, and Look Ahead |
| [`templates/`](templates/) | Shared templates (evidence write-ups, etc.) |
| [`submissions/`](submissions/) | Where your work goes — one folder per person/group, per activity |
| [`.github/`](.github/) | PR template and the CI workflow that checks submissions |

Every activity works the same way: read its brief under `activities/<id>/`, submit
under `submissions/<id>/<your-identifier>/`, and — if the activity has an automated
checker — run `bash activities/<id>/check.sh submissions/<id>/<your-identifier>`
yourself before opening a PR. See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the full
rules.

## Grading

Class Standing (per grading period) = Quizzes 20% + Lab Activities 30% +
Seatwork/Assignment/Recitation 10%, per the official OBTL. Everything in this repo
counts toward Lab Activities and/or Seatwork/Assignment/Recitation, depending on the
activity — see each activity's own `.md` file for its exact weight.

## Questions

Ask me in our class channel, or open an Issue on this repo.
