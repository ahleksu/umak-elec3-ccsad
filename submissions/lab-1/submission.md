# Lab 1 Submission

## Part B
**Error Action Name:**

Instance launch failed

You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* because no identity-based policy allows the ec2:RunInstances action.
<img width="1471" height="741" alt="PartBError" src="https://github.com/user-attachments/assets/a90e7016-8c11-40ef-8758-cbfea73f632a" />


## Part C
**Policy Statement Blanks:**
- `"Action"`: "ec2:RunInstances"
- `"Resource"`: "instance"
- `"ec2:InstanceType"`: "t3.micro"

## Part D
**Security Group Error Text:** 

You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action.
**Running Instance Time:** 20:30 UTC+8

Screenshot of the instance in the Running state.
<img width="1609" height="110" alt="Screenshot 2026-09-22 214618" src="https://github.com/user-attachments/assets/026cffd2-b1db-46fc-91a5-49fb1a5e074b" />
<img width="1877" height="908" alt="Screenshot 2026-09-22 205047" src="https://github.com/user-attachments/assets/6c463a7b-fa8b-4ca1-88a8-f24ad1046212" />
(Sorry, I was not able to take a screenshot of it in a running state I hope this will suffice

## Part E
**t3.small / Tokyo Denial Error:** 

Instance launch failed

You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary.
<img width="1880" height="894" alt="PartEError" src="https://github.com/user-attachments/assets/410411f9-a8b1-453e-a15e-a01ee8fedb33" />

The AMI ID (ami-06380d26ad7176f2c) is not valid. The AMI might no longer exist or may be specific to another account or Region.
<img width="973" height="556" alt="Screenshot 2026-09-22 213416" src="https://github.com/user-attachments/assets/a520b9b0-b7a5-4de0-b845-cf30d240d6ee" />

No VPCs found, either this account doesn’t have any VPCs in this region or an invalid search has been entered. Please refine the search query, create a new VPC or create a new default VPC
<img width="1858" height="885" alt="Screenshot 2026-09-22 203723" src="https://github.com/user-attachments/assets/f6da880b-6322-4310-a088-c089d4914587" />

**CloudTrail errorMessage:**

User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary.
<img width="1867" height="927" alt="Screenshot 2026-09-22 205930" src="https://github.com/user-attachments/assets/94ca3189-07f9-480c-b009-bfc8ac323b54" />

## Part F Questions
1. Which action did the Part B error name?
   It named the action `ec2:RunInstances`.
2. In your policy, which condition limits `ec2:RunInstances`?
   The condition that limits it is `"ec2:InstanceType": "t3.micro"`.
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   It was denied because the boundary statement `DenyAnyInstanceTypeButT3Micro` acts as an absolute limit, explicitly blocking it and overriding the wide allow policy.
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   It violates the principle of least privilege. If the account is compromised, an attacker has full control to modify or delete anything permitted within the boundary, rather than only having access to the specific resources needed for the job.
5. In two sentences: what does the boundary control that your policy cannot?
   The boundary establishes the maximum possible permissions, such as restricting actions to specific regions or instance sizes, enforced by an administrator. Your user policy can only grant permissions within that strict predefined perimeter.
