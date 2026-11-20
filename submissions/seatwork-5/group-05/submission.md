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

- Group number: 05  
- Section: IV-CCSAD  
- Group IAM user: ccsad-g05  
- Table name: umak-elec3-ccsad-g05-messages  
- Bucket name: umak-elec3-ccsad-g05-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

    When we run aws cloudformation deploy using a valid template, AWS CloudFormation reads the declarative configuration file and provisions, updates, or synchronizes the defined AWS resources in our target account and region. If the stack does not yet exist, CloudFormation creates a new stack and orchestrates the creation of all specified resources like Lambda functions or DynamoDB tables in the correct order. If the stack already exists, it calculates a change set, compares our local template against the deployed state, and applies only the necessary modifications which ensures our infrastructure matches the code. 

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

    Making infrastructure changes via a version-controlled template and a Pull Request (PR) is significantly safer than making manual modifications in the AWS Management Console ("ClickOps") for several key reasons. A PR forces a second pair of eyes to review the changes before they hit production, catching typos, misconfigurations, or dangerous settings like open security group rules. Git provides an immutable history of who made a change, when it was made, and why via commit messages and PR descriptions, whereas console clicks leave no built-in contextual history. CI/CD pipelines can automatically run linters, security scanners such as cfn-lint or Checkov, and dry-run change sets to flag compliance or syntax issues before deployment

    This practice primarily serves the Operational Excellence pillar by managing infrastructure as code, automating changes, and reducing human error and the Security pillar by enforcing governance, least privilege, and configuration validation before code deployment.


## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| DeviDo2 | Lead the group and created the template.yaml |
| gracefeliciano | Created the main.tf |
| PalattaoMekylla | Answered the questions |
| GlorianaSkye | Answered the questions |