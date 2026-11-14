# Seatwork 5: Write Your Group's Resources as Code

This is a self-guided activity. In the last lecture, the Lab 4 table appeared as a file: once as an AWS CloudFormation template and once in Terraform. In this seatwork, your group writes two of its own resources as code, in both tools: the Lab 4 messages table and the Seatwork 3 site bucket. You do not sign in to AWS, and you create nothing, so this seatwork costs nothing.

Work through this page first. It explains the ideas that the files use. Then follow the steps in [`seatwork.md`](seatwork.md).

## What you do

This is group work. You do not sign in to AWS. Your group submits one Pull Request, and one groupmate submits its link in the Google Form.

1. Write `template.yaml`, a CloudFormation template with your group's table and site bucket.
2. Write `main.tf`, a Terraform file with the same table and bucket.
3. Tag every resource with your course and your group.
4. Answer two questions in `submission.md`.
5. Open one Pull Request, then submit its link in the Google Form.

## Key ideas

### Infrastructure as Code

Up to now, your group made each resource with clicks in the AWS console. Infrastructure as Code (IaC) means that you write the resources in a file instead. A tool reads the file and makes the resources for you.

A file has four advantages over clicks:

- You keep it in Git and review a change in a Pull Request, the way you submit your work in this repository.
- You run the same file again and get the same setup: in another Region, for another group, or after a mistake.
- You delete the whole setup with one command, so nothing that you forgot keeps billing.
- The file shows what exists and why, so the next person does not have to guess from the console.

### AWS CloudFormation

CloudFormation is the IaC service of AWS. You write a template in YAML or JSON. Each entry under `Resources` has a logical name that you choose, a `Type`, and its `Properties`. When you deploy the template, CloudFormation makes a stack, and the stack makes every resource in the template. When you delete the stack, CloudFormation deletes its resources too.

This is the template from the lecture, for the table of the demo group `demo-g01`:

```yaml
AWSTemplateFormatVersion: "2010-09-09"
Description: The Lab 4 messages table

Resources:
  MessagesTable:
    Type: AWS::DynamoDB::Table
    Properties:
      TableName: umak-elec3-demo-g01-messages
      BillingMode: PAY_PER_REQUEST
      AttributeDefinitions:
        - AttributeName: id
          AttributeType: S
      KeySchema:
        - AttributeName: id
          KeyType: HASH
```

`PAY_PER_REQUEST` is on-demand capacity. `S` means String. `HASH` marks the partition key.

In YAML, the spaces at the start of a line set the level of each entry. Use two spaces for each level, never tabs.

### Terraform

Terraform is an IaC tool from HashiCorp. You write `.tf` files in HCL (HashiCorp Configuration Language). The same language works for AWS, Azure, Google Cloud, and more. `terraform plan` shows what will change, `terraform apply` makes the change, and `terraform destroy` removes everything.

This is the same table in Terraform, from the lecture:

```hcl
provider "aws" {
  region = "ap-southeast-1"
}

# The Lab 4 messages table
resource "aws_dynamodb_table" "messages" {
  name         = "umak-elec3-demo-g01-messages"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
```

Each `resource` block has a type, here `aws_dynamodb_table`, and a local name that you choose, here `messages`. One resource refers to another by type and name, for example `aws_s3_bucket.site.id`.

### From console clicks to code

In Seatwork 3, your group made the site bucket in four console steps. Each step is one setting in the code:

| Seatwork 3 step in the console | CloudFormation | Terraform |
| --- | --- | --- |
| Create the bucket `umak-elec3-<group user>-linktree` | A resource of type `AWS::S3::Bucket` with `BucketName` | A resource `aws_s3_bucket` with `bucket` |
| Enable static website hosting with the index document `index.html` | The property `WebsiteConfiguration` of the bucket, with `IndexDocument` | A resource `aws_s3_bucket_website_configuration` with an `index_document` block |
| Clear **Block all public access** | The property `PublicAccessBlockConfiguration` of the bucket, with all four settings `false` | A resource `aws_s3_bucket_public_access_block` with all four settings `false` |
| Add the bucket policy that allows `s3:GetObject` | A resource of type `AWS::S3::BucketPolicy` with `Bucket` and `PolicyDocument` | A resource `aws_s3_bucket_policy` with `bucket` and `policy` |

The upload of `index.html` is not part of this seatwork. An IaC tool makes the bucket. You upload the page as before.

### Tags in code

A tag is a key and a value on a resource. With the tags `course = elec3` and `group = <group user>`, Cost Explorer can split the bill by group. In code, every copy of the setup gets its tags, and nobody forgets them.

### You write the files, but you do not deploy them

Your group IAM user cannot create CloudFormation stacks, and your table and bucket already exist. So you write and review the files, but you do not run them. The two questions in `submission.md` ask what would happen if you did.

## Cost

You create nothing in AWS, so this seatwork costs nothing.

## How you submit

Your group opens one Pull Request with `template.yaml`, `main.tf`, and `submission.md`. Then one groupmate submits its link in the Google Form for the group: https://forms.gle/ERqQ87uD2XDLUj5d6.

It is due on Thursday, November 19, 2026, at 11:59 PM (Asia/Manila), the same deadline as Lab 5 and Assignment 5.

## Files in this folder

| File | What it is |
| --- | --- |
| [`README.md`](README.md) | This page: what you do and the IaC ideas behind it. |
| [`seatwork.md`](seatwork.md) | The steps, what to submit, the scoring, and what to check when you get stuck. |
| [`submission-template.md`](submission-template.md) | Copy it to your submission folder as `submission.md` and fill it in. |
