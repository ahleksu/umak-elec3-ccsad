# Seatwork 5 Submission

## About us

- Group number: 9
- Section: IV-CCSAD
- Group IAM user: ccsad-g09
- Table name: umak-elec3-ccsad-g09-messages
- Bucket name: umak-elec3-ccsad-g09-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy fails and the stack rolls back. CloudFormation tries to create a new table named `umak-elec3-ccsad-g09-messages` and a new bucket named `umak-elec3-ccsad-g09-linktree`, but both names are already taken by the resources that we made in the console. A DynamoDB table name must be unique in the account and Region, and an S3 bucket name must be unique across all AWS accounts, so the create calls fail with "already exists". CloudFormation does not take over resources it did not create, so it rolls back and our existing table and bucket stay as they are. To manage them with CloudFormation, we would have to import them into a stack first.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

In a Pull Request, a groupmate reviews the exact change, line by line, before anything is deployed, and Git keeps a history, so a mistake can be caught early or rolled back to the last working version. A console click has no review and no record of what changed. This serves the Operational Excellence pillar, which asks us to perform operations as code and make small, reviewed, reversible changes.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Jsmnt | Wrote `template.yaml` and `main.tf`, and wrote this submission |
| NotLathrell | Checked the bucket settings against our Seatwork 3 setup |
| Edison | Checked the table settings against our Lab 4 setup |
| Jhayrome | Reviewed the answers to the two questions |
