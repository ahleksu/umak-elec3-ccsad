## About us

- Group number: 06
- Section: ccsad
- Group IAM user: ccsad-g06
- Table name: umak-elec3-ccsad-g06-messages
- Bucket name: umak-elec3-ccsad-g06-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment would fail and roll back. Our template creates a table and a bucket with fixed names, and those names are already taken by the table and bucket we made by hand in Lab 4 and Seatwork 3. CloudFormation only manages resources it creates itself. It can’t take over existing ones, so AWS rejects the create requests and the stack ends in ROLLBACK_COMPLETE.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A template change is written down and reviewed in a Pull Request, so teammates can catch mistakes before anything is deployed. Git also keeps a history and lets us revert a bad change, and the template gives the same result every time. A console change is unreviewed clicks with no record and is hard to repeat. This serves the Operational Excellence pillar (perform operations as code).

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| keiameere | main.tf |
| MadBunbun | answered submission.md |
| kadirisubs | main guide |
| malorian-arms3516 | template.yaml |
