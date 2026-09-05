---
week: 3
graded: true
counts_toward: Seatwork/Assignment/Recitation (10% of Midterm Class Standing)
mode: Individual, take-home — submit by Pull Request to your section's GitHub repo
estimated_time: 45–60 minutes
due: 2026-09-07, 12:00 AM (Asia/Manila) — the Google Form closes at this time
---

# Assignment 1 — Course Materials Portal: Diagnose, Fix, and Look Ahead

## About this assignment

This assignment has two parts. Part 1 reviews Linux permissions. Part 2
introduces one idea from system architecture.

Read the reference sections first. Use them to answer every question below.

## Permissions in octal notation

**Optional video (10 minutes):** watch
["the absolute basics of file permissions (chmod and octals) you need to know"](https://www.youtube.com/watch?v=q7kqrGC_sXE)
for a walkthrough of this section. The text below covers the same material.

A Linux file has three permission holders: owner, group, and others. Each
holder can have read (r), write (w), and execute (x) permission.

Octal notation uses one digit, from 0 to 7, for each holder. Add these
values for each permission the holder has:

- read = 4
- write = 2
- execute = 1
- no permission = 0

Add the values together. Read and write together equal 4 + 2 = 6. Read and
execute together equal 4 + 1 = 5. Read, write, and execute together equal
4 + 2 + 1 = 7.

This table shows every digit:

| Digit | Symbolic | Meaning |
| :-: | :-: | --- |
| 0 | `---` | no access |
| 1 | `--x` | execute only |
| 2 | `-w-` | write only |
| 3 | `-wx` | write and execute |
| 4 | `r--` | read only |
| 5 | `r-x` | read and execute |
| 6 | `rw-` | read and write |
| 7 | `rwx` | read, write, and execute |

A full permission mode has three digits, in this order: owner, group,
others. For example, `640` means: owner has `rw-` (6), group has `r--` (4),
others has `---` (0).

**Example.** Convert `-rw-------` to octal:

- Owner: `rw-` = 4 + 2 = 6
- Group: `---` = 0
- Others: `---` = 0
- Full mode: `600`

This table shows the four choices in Question 3. Use it to compare them:

| Option | Owner | Group | Others |
| :-: | :-: | :-: | :-: |
| `400` | `r--` | `---` | `---` |
| `640` | `rw-` | `r--` | `---` |
| `755` | `rwx` | `r-x` | `r-x` |
| `777` | `rwx` | `rwx` | `rwx` |

## Commands and locations in this assignment

- `ls -l` shows a file's permissions and owner.
- `cat` and `grep` show or search the content of a file.
- `id <user>` shows a user's groups.
- `chmod` changes a file's permissions.
- `/etc/` holds system and service configuration files.
- `/var/log/` holds application and system log files.

## The scenario

The Course Materials Portal shows an error after a configuration change.
Here is the evidence:

```text
/var/log/course-portal/app.log:
ERROR cannot read /etc/course-portal/portal.conf: Permission denied

$ ls -l /etc/course-portal/portal.conf
-rw------- 1 root course-portal 248 Aug 31 18:10 portal.conf

$ id course-portal
uid=995(course-portal) gid=995(course-portal) groups=995(course-portal)
```

## Part 1 — Diagnose

Answer these six questions. Use only the evidence above and the reference
sections.

1. State the failure in one sentence. Use the evidence in the log line.
2. Explain why the `course-portal` account cannot read the file. Name its
   owner, group, and others permissions.
   *Hint: Convert `-rw-------` to octal first. Then check whether
   `course-portal` is the file's owner or a group member.*
3. Choose the smallest fix that solves the problem: `400`, `640`, `755`, or
   `777`. Explain why the other three are wrong.
   *Hint: Use the four-option table above. Find the column that needs read
   access.*
4. Put these nine actions in the correct order. Write the letters in
   sequence, for example: `C, A, ...`

   | Letter | Action |
   | --- | --- |
   | A | Apply the change |
   | B | Reproduce or observe the failure |
   | C | Verify service or application behavior |
   | D | Inspect ownership and permissions |
   | E | Locate the implicated file |
   | F | Propose the minimum change |
   | G | Inspect logs |
   | H | Record the limitation or next check |
   | I | Verify file state |

   *Hint: Confirm the failure before you inspect it. Inspect before you
   change. Change before you verify.*
5. Name one risk of using `chmod 777` instead of your answer to Question 3.
   *Hint: Check the `777` row in the four-option table. Who gains write and
   execute access?*
6. Name one piece of evidence, beyond a successful command, that proves the
   service works again.
   *Hint: A command can succeed and the service can still be broken. What
   check confirms the service itself works?*

## Part 2 — Look ahead

Complete this sentence in your own words. Use one short phrase for each
blank.

> The server-level failure happened in the **___** component. A larger
> system needs **___** to detect it, **___** to recover from it, and
> **___** to prove that users are served again.

## How to submit

1. Fork this repository. Clone your fork.
2. Create the file `submissions/assignment-1/<github_username>/answers.md`.
3. Copy the answer template below into that file. Fill in every line.
4. Run the checker before you open a pull request:
   ```bash
   bash activities/assignment-1/check.sh submissions/assignment-1/<github_username>
   ```
5. Open a pull request against this repository.
6. When your pull request passes its check, submit the pull request link
   through this form: <https://forms.gle/XP5Mmnc7G7USqqgT9>

The form closes **September 7, 12:00 AM (Asia/Manila)**. Submit before then.

## Answer template

Copy this into `answers.md`. Keep the labels as written.

```markdown
ANSWER_1: <your one-sentence failure statement>
ANSWER_2: <your explanation>
ANSWER_3: <400 | 640 | 755 | 777>
ANSWER_3_WHY: <why the other three are wrong>
ANSWER_4_ORDER: <nine letters in your order, for example: A, B, C, D, E, F, G, H, I>
ANSWER_5: <one risk of chmod 777>
ANSWER_6: <evidence that proves recovery>
ANSWER_7_BRIDGE: component=<...>, detect=<...>, recover=<...>, proof=<...>
```

## Grading (10 points)

| Part | Points |
| --- | --- |
| Questions 1 and 2 | 3 |
| Questions 3 and 5 | 2 |
| Question 4 | 2 |
| Question 6 | 1 |
| Question 7 | 2 |

The checker grades Questions 3, 4, and 5 automatically. A person grades
Questions 1, 2, 6, and 7.

## AI tools

You may use an AI tool to understand a concept. Write your answers in your
own words. If a concept is still unclear, say so in your answer. See your
course's AI-use policy for what counts as acceptable assistance.
