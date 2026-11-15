# Seatwork 5 Submission

## About us

- Group number: 08
- Section: IV-CCSAD
- Group IAM user: ccsad-g08
- Table name: umak-elec3-ccsad-g08-messages
- Bucket name: umak-elec3-ccsad-g08-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy would fail. Our table and bucket were made by hand in the console, so they are not part of any stack. CloudFormation would try to create a new table named `umak-elec3-ccsad-g08-messages` and a new bucket named `umak-elec3-ccsad-g08-linktree`, because the template gives fixed names. A DynamoDB table name must be unique in the Region of the account, and an S3 bucket name must be unique across all of AWS, so both names are already taken. The create steps would error with "already exists", and the stack would roll back. CloudFormation only manages resources that it created itself, so it does not take over our existing ones, and our table and bucket would stay as they are.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A change in a template is written down and reviewed by groupmates in a Pull Request before it is applied, so a wrong setting, such as leaving a bucket open by mistake, can be caught first. A click in the console happens at once, leaves no record of what changed, and nobody else sees it. Git also keeps the history, so we can see who changed what and go back to an earlier version. This serves the Operational Excellence pillar, because it makes changes small, reviewed, repeatable and easy to roll back.

## Contribution

| GitHub username | What this groupmate did                                                           |
| --------------- | --------------------------------------------------------------------------------- |
| shamKirzon      | Made the branch and folder, and pushed the submission, open the Pull Request      |
| h0pSpaint       | Wrote `template.yaml` (the table, the site bucket, and the bucket policy)         |
| deejay-torres   | Wrote `main.tf` (the same table and bucket in Terraform)                          |
| lurrenggg       | Filled in `submission.md`, answered Question 1 and 2, and opened the Pull Request |
