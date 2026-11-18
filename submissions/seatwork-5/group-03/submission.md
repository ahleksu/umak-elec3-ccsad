# Seatwork 5 Submission

## About us

- Group number: 03
- Section: IV-CCSAD
- Group IAM user: `ccsad-g03`
- Table name: `umak-elec3-ccsad-g03-messages`
- Bucket name: `umak-elec3-ccsad-g03-linktree`

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

   A normal deployment to a new stack in Singapore would fail because CloudFormation would try to create a DynamoDB table and S3 bucket using names that already exist. It does not take over resources created in the console just because their names match. To manage those resources in a stack without recreating them, we would need a separate [CloudFormation resource import](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/import-resources-manually.html).

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

   A teammate can read the exact change in the pull request and catch a mistake before it affects the live resources. For example, they could spot a bucket policy that grants write access instead of only `s3:GetObject`. This supports the [Operational Excellence pillar](https://docs.aws.amazon.com/wellarchitected/latest/framework/ops-operations-as-code.html) by making infrastructure changes reviewable before deployment.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| dcchristine | Coordinated the work and checked both templates against the rubric, including the resource names and tags. |
| salgadojamesvan | Prepared the CloudFormation definitions for the messages table and website bucket, including the read-only bucket policy. |
| yajiiiii | Prepared the matching Terraform definitions and checked the bucket policy's dependency on the public-access-block resource. |
| Tajarros-Zed | Verified that both templates describe the same resources and assembled the answers in `submission.md`. |
