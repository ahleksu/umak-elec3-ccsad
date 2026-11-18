# Seatwork 5 Submission

## About us

- Group number: 01
- Section: IV-CCSAD
- Group IAM user: ccsad-g01
- Table name: umak-elec3-ccsad-g01-messages
- Bucket name: umak-elec3-ccsad-g01-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment would fail and CloudFormation would roll back the stack. Because we hardcoded explicit names (`umak-elec3-ccsad-g01-messages` and `umak-elec3-ccsad-g01-linktree`) that already exist in the AWS account from Lab 4 and Seatwork 3, AWS will reject the creation with `AlreadyExists` / `BucketAlreadyOwnedByYou` errors rather than adopting or overwriting existing unmanaged resources.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Writing infrastructure changes in a template and reviewing them via a Pull Request enforces peer review, version control, and automated validation before deployment, preventing accidental misconfigurations or human click-errors in the console and allowing easy rollbacks. This primarily serves the **Operational Excellence** pillar of the AWS Well-Architected Framework (specifically the best practice of performing operations as code).

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| NathanielCamachoUmak | Created template.yaml and opened pull request |
| madeliiine | Made main.tf and verified resource attributes |
| kcalicaa12346055-sudo | Reviewed YAML/HCL syntax |
| flaaa01 | answered reflection questions |