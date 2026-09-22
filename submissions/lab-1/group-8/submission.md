# Lab 1 Submission

**Team IAM user:** `ccsad-g08`  
**Region:** `ap-southeast-1` (Singapore)

## Part B

**Error Action Name:**  
Instance launch failed. You are not authorized to perform this operation. User: `arn:aws:iam::548387266019:user/ccsad-g08` is not authorized to perform: **ec2:RunInstances** on resource: `arn:aws:ec2:ap-southeast-1:548387266019:instance/`* because no identity-based policy allows the ec2:RunInstances action.

**Screenshot (Part B launch denial with username visible):**
Part B Error

## Part C

**Policy Statement Blanks:**

- `"Action"`: "ec2:RunInstances"
- `"Resource"`: "instance"
- `"ec2:InstanceType"`: "t3.micro"

## Part D

**Security Group Error Text:**  
You are not authorized to perform this operation. User: `arn:aws:iam::548387266019:user/ccsad-g08` is not authorized to perform: **ec2:CreateSecurityGroup** on resource: `arn:aws:ec2:ap-southeast-1:548387266019:security-group/`* because no identity-based policy allows the ec2:CreateSecurityGroup action.

**Running Instance Time: 2026-09-22 ~20:30 (Asia/Manila)**

**Screenshot 1 (Permissions tab listing ccsad-g08-launch):**
Permissions Tab

**Screenshot 2 (Instance in Running state):**
Running Instance

**Note:** Instance had only a `Name` tag (`ccsad-g08-test`) and was missing `team=ccsad-g08`, so Terminate was denied. Left for the account 90-minute automatic cutoff.

## Part E

**t3.small / Tokyo Denial Error:**  
Instance launch failed. You are not authorized to perform this operation. User: `arn:aws:iam::548387266019:user/ccsad-g08` is not authorized to perform: **ec2:RunInstances** on resource: `arn:aws:ec2:ap-southeast-1:548387266019:instance/`* with an explicit deny in a permissions boundary: `arn:aws:iam::548387266019:policy/umak-lab-boundary`.

**Screenshot 1 (t3.small or Tokyo denial):**
Boundary Denial

**Screenshot 2 (CloudTrail event showing errorMessage):**
CloudTrail Event

## Part F Questions

1. Which action did the Part B error name?
  `ec2:RunInstances`
2. In your policy, which condition limits `ec2:RunInstances`?
  The condition `StringEquals` on `ec2:InstanceType` must equal `t3.micro`.
3. After you attached `ec2:`* on `*`, why was `t3.small` still denied? Name the boundary statement.
  The permissions boundary still blocked it with an explicit deny. The boundary statement is `DenyAnyInstanceTypeButT3Micro`.
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
  It violates least privilege by allowing every EC2 action. If the boundary is ever removed or weakened, that wide allow becomes dangerous.
5. In two sentences: what does the boundary control that your policy cannot?
  The permissions boundary sets a hard maximum on what the user can ever do, even if identity policies allow more. Our attached policy can only grant permissions inside that limit; it cannot override a boundary deny.

