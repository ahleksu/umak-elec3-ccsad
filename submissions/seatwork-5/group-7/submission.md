# Seatwork 5 Submission

<!--
How to use this template:

1. Copy this file to submissions/seatwork-5/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save template.yaml and main.tf in the same folder.
4. Do not put an access key, a password, an invoke URL, or the AWS account number in any file.
5. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 7
- Section: IV - CCSAD
- Group IAM user: ccsad-g07
- Table name: umak-elec3-ccsad-g07-messages
- Bucket name: umak-elec3-ccsad-g07-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy fails and the stack rolls back. The table umak-elec3-ccsad-g07-messages already exists because we created it by hand in the console, and CloudFormation only manages resources it created itself, so it tries to make a new one and DynamoDB refuses the duplicate name. CloudFormation then marks the stack as failed and undoes anything it had already created, such as the bucket.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A change in a template is written down, so teammates can read it and catch mistakes in a Pull Request before anything is deployed. A console click has no review and no record, while the Git history shows who changed what and lets us revert and redeploy an earlier version if something breaks. This serves the Operational Excellence pillar, which asks us to perform operations as code and make small, reversible changes.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| rewyuu | Made the cloudformation file and terraform file |
| LarsUlrichPons | Answered question 1 |
| JeromeMagno | Answered question 2 |
| VobAviso | Wrote everything needed for submission |
