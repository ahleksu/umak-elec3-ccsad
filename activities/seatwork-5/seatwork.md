---
week: 16
graded: true
counts_toward: Final Class Standing, Seatwork/Assignment/Recitation (10%)
duration: About 1 hour, self-guided
mode: Group. No AWS sign-in. One Pull Request for each group, and one groupmate submits its link in the Google Form.
coverage: Infrastructure as Code, AWS CloudFormation templates, Terraform resources, the Lab 4 DynamoDB table and the Seatwork 3 S3 website bucket as code, tags for cost allocation
due: Thursday, November 19, 2026, 11:59 PM (Asia/Manila)
---

# Seatwork 5: Write Your Group's Resources as Code

> Due on Thursday, November 19, 2026, at 11:59 PM (Asia/Manila). Your group opens one Pull Request. Then one groupmate submits its link in the Google Form for the group: https://forms.gle/ERqQ87uD2XDLUj5d6.

This is a self-guided activity. Your group writes its Lab 4 table and its Seatwork 3 site bucket as code, once in AWS CloudFormation and once in Terraform. You do not sign in to AWS, so this activity costs nothing. Read [`README.md`](README.md) before you start. It explains the two tools and the example that you start from.

## Before you start

- Work with your groupmates in a call or in your group chat.
- Use your group IAM user, the same user from Lab 1 to Lab 5, for example `acsad-g03`. In every name below, replace `<group user>` with it. The table of names in the [Lab 5 brief](../lab-5/lab.md) shows the names of your bucket and table.
- Use a code editor, for example Visual Studio Code. A YAML file breaks when a line has the wrong number of spaces, and an editor shows them.
- Do not put an access key, a password, an invoke URL, or your AWS account number in any file.

## Step 1. Make your branch and folder

In your fork, make a branch named `seatwork-5-group-<number>`. Make the folder `submissions/seatwork-5/group-<number>/`. All three of your files go in this folder.

## Step 2. Write your table in CloudFormation

Create `template.yaml`. Copy the CloudFormation example from [`README.md`](README.md). Then change it for your group:

1. Change the table name to `umak-elec3-<group user>-messages`.
2. Change the `Description` to name your group, for example `The Lab 4 table and the Seatwork 3 site of acsad-g03`.
3. Add two tags to the table, under `Properties`, at the same level as `BillingMode`:

```yaml
      Tags:
        - Key: course
          Value: elec3
        - Key: group
          Value: <group user>
```

## Step 3. Add your site bucket to the template

Under `Resources`, after the table, add two more resources. Use the table "From console clicks to code" in [`README.md`](README.md):

1. A bucket with the logical name `SiteBucket`, of type `AWS::S3::Bucket`:
   - `BucketName` is `umak-elec3-<group user>-linktree`.
   - `WebsiteConfiguration` has `IndexDocument: index.html`.
   - `PublicAccessBlockConfiguration` sets `BlockPublicAcls`, `BlockPublicPolicy`, `IgnorePublicAcls`, and `RestrictPublicBuckets` to `false`.
   - The same two tags as the table.
2. A bucket policy with the logical name `SiteBucketPolicy`, of type `AWS::S3::BucketPolicy`:
   - `Bucket` points to your bucket with `!Ref SiteBucket`.
   - `PolicyDocument` is your Seatwork 3 bucket policy, written in YAML in place of JSON. It allows only `s3:GetObject`, for the principal `"*"`, on the objects of your bucket: `!Sub "arn:aws:s3:::${SiteBucket}/*"`.

`!Ref SiteBucket` gives the name of the bucket that the template makes. `!Sub` puts that name into the text. With them, the policy always points to the bucket in the same template.

## Step 4. Write the same resources in Terraform

Create `main.tf`. Copy the Terraform example from [`README.md`](README.md), with your table name. Then add:

1. A `tags` map to the table:

```hcl
  tags = {
    course = "elec3"
    group  = "<group user>"
  }
```

2. A resource `aws_s3_bucket` named `site`, with `bucket = "umak-elec3-<group user>-linktree"` and the same `tags`.
3. A resource `aws_s3_bucket_website_configuration` named `site`, with `bucket = aws_s3_bucket.site.id` and an `index_document` block with `suffix = "index.html"`.
4. A resource `aws_s3_bucket_public_access_block` named `site`, with `bucket = aws_s3_bucket.site.id` and the same four settings as `false`: `block_public_acls`, `block_public_policy`, `ignore_public_acls`, and `restrict_public_buckets`.
5. A resource `aws_s3_bucket_policy` named `site`, with `bucket = aws_s3_bucket.site.id`, and a `policy` that allows only `s3:GetObject` for the principal `"*"` on `"${aws_s3_bucket.site.arn}/*"`. Write the policy with `jsonencode({ ... })`. Add `depends_on = [aws_s3_bucket_public_access_block.site]`, because S3 refuses a public policy while Block Public Access is on.

If your group has Terraform installed, `terraform init`, then `terraform fmt` and `terraform validate`, check your file. They do not need AWS access and do not create anything. This check is optional.

## Step 5. Answer two questions

Copy [`submission-template.md`](submission-template.md) to your folder as `submission.md`. Fill in your group details and answer:

1. Your table and your bucket already exist, because your group made them in the console. Suppose that your group user could create stacks, and you ran `aws cloudformation deploy` with your template today. What happens, and why?
2. A change written in a template and reviewed in a Pull Request is safer than the same change made in the console. Give one reason, and name the Well-Architected pillar that it serves.

## What to submit

1. In `submissions/seatwork-5/group-<number>/`, on the branch `seatwork-5-group-<number>`:
   - `template.yaml`: your CloudFormation template.
   - `main.tf`: your Terraform file.
   - `submission.md`: your group details, your answers, and one line per groupmate (GitHub username and what each one did).
2. Open one Pull Request. One groupmate submits its link in the Google Form for the whole group: https://forms.gle/ERqQ87uD2XDLUj5d6.

| Check | Points |
| --- | --- |
| `template.yaml`: the table `umak-elec3-<group user>-messages`, on-demand, with the partition key `id` (String) | 3 |
| `template.yaml`: the bucket `umak-elec3-<group user>-linktree` with website hosting (`index.html`), Block Public Access off, and a bucket policy that allows only `s3:GetObject` on its objects | 4 |
| `main.tf`: the same table | 3 |
| `main.tf`: the same bucket, website configuration, public access block, and bucket policy | 4 |
| The tags `course` and `group` on the table and the bucket, in both files | 1 |
| Question 1: what happens, and why | 2 |
| Question 2: one reason, and the pillar | 2 |
| `submission.md` is complete, with no secret or account number in any file | 1 |
| **Total** | **20** |

## If you get stuck

| What you see | What to check |
| --- | --- |
| You do not know your group IAM user | It is the user that your group signs in with, for example `acsad-g03`. If you are not sure, message me in the group chat |
| Your editor marks a YAML line in red | Count the spaces. Each level is two spaces more than the level above it, and a list item starts with `- `. Never use tabs |
| You are not sure where `Tags` or `WebsiteConfiguration` goes | Both go under `Properties` of the resource, at the same level as `BucketName` |
| Your policy in YAML looks different from the JSON of Seatwork 3 | It is the same policy. YAML drops the braces and the quotes around keys. `Effect`, `Principal`, `Action`, and `Resource` keep their values |
| `terraform validate` says a reference is not declared | The type and name must match: `aws_s3_bucket.site` needs a resource `aws_s3_bucket` named `site` |
| `terraform init` fails | It downloads the AWS provider, so it needs the internet. The check is optional. Review the file by hand and submit |
| Your Pull Request check fails because of a file outside your folder | Move every file into `submissions/seatwork-5/group-<number>/` |
| The Google Form does not open, or it closed before you submitted | Message me in the group chat right away |

Documentation, if you want more detail: [What is AWS CloudFormation?](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html), [AWS::S3::Bucket](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-s3-bucket.html), [AWS::S3::BucketPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-s3-bucketpolicy.html), [AWS::DynamoDB::Table](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-dynamodb-table.html), [Terraform AWS provider: aws_s3_bucket_website_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration), and [Terraform AWS provider: aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy).
