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

- Group number: Group-2
- Section: IV-CCSAD
- Group IAM user: ccsad-g02
- Table name: umak-elec3-ccsad-g02-messages
- Bucket name: umak-elec3-ccsad-g02-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment would fail and automatically roll back because both the DynamoDB table and the S3 bucket already exist in AWS with those exact hardcoded names. Since S3 bucket names must be globally unique and DynamoDB table names must be unique within our account and region, CloudFormation cannot create duplicate resources over the ones we manually built in the console. Unless those existing resources are explicitly imported into the stack first, CloudFormation will reject the deployment with an "already exists" error.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Making changes in a template and reviewing them through a Pull Request lets teammates catch typos or security misconfigurations before anything goes live, while also keeping a clear Git history of who changed what. Unlike clicking around in the AWS Console—where a single accidental click can immediately break or expose a resource—a Pull Request adds a safety check before deployment. This directly serves the Operational Excellence pillar of the AWS Well-Architected Framework.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| rssnjade | Wrote the Terraform configuration (`main.tf`) for the DynamoDB table, S3 website bucket, public access block, and bucket policy |
| RalphEspartero3 | Created the Git branch and submission folder, verified resource names and tags, and managed the Pull Request |
| DietherUrdas | Wrote the AWS CloudFormation template (`template.yaml`) for the DynamoDB table, S3 bucket, and bucket policy |
| saromoAndreiLuis | Answered the conceptual questions in `submission.md` and reviewed all files for syntax accuracy and secret compliance |
