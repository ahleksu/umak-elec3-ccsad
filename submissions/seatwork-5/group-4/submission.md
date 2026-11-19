# Seatwork 5 Submission

## About us

- Group number: 4
- Section: IV-CCSAD
- Group IAM user: ccsad-g04
- Table name: umak-elec3-ccsad-g04-messages
- Bucket name: umak-elec3-ccsad-g04-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

   It would fail if our template tries to create a table and bucket with names that already exist. CloudFormation would try to create new resources instead of automatically using the existing ones.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

   A Pull Request lets our group check the changes and catch mistakes before using the template. This supports the Operational Excellence pillar because the changes are recorded and reviewed.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| StDevRhenz | Prepared the CloudFormation and Terraform drafts and wrote the submission answers. |
| Andre-Arcilla | Reviewed the CloudFormation table, bucket, and policy definitions. |
| ScarlettRed6 | Checked the Terraform resources and tags against the Seatwork 5 requirements. |
| paupausiopau | Reviewed the answers and the final submission files. |
