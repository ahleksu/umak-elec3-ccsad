# Lab 1 Submission (EXAMPLE)

*Note: This is an example of what your submission should look like. Do not copy these fake answers.*

## Part B
**Error Action Name:** 
Instance launch failed. You are not authorized to perform this operation... is not authorized to perform: **ec2:FakeActionName** on resource...

**Screenshot:**
![Part B Error](example-part-b-error.png)

## Part C
**Policy Statement Blanks:**
- `"Action"`: "ec2:FakeActionName"
- `"Resource"`: "fake-resource"
- `"ec2:InstanceType"`: "t2.nano"

## Part D
**Security Group Error Text:** 
User demo-user is not authorized to perform: ec2:CreateSecurityGroup on resource...

**Running Instance Time:** 14:05 UTC

**Screenshot 1 (Permissions Tab):**
![Permissions Tab](example-part-d-policy.png)

**Screenshot 2 (Running Instance):**
![Running Instance](example-part-d-instance.png)

## Part E
**t3.small / Tokyo Denial Error:** 
Instance launch failed... with an explicit deny in a permissions boundary.

**Screenshot 1 (Boundary Denial):**
![Boundary Denial](example-part-e-denial.png)

**Screenshot 2 (CloudTrail Event):**
![CloudTrail Event](example-part-e-cloudtrail.png)

## Part F Questions
1. Which action did the Part B error name?
   (Example answer): It named the action `ec2:FakeActionName`.
2. In your policy, which condition limits `ec2:RunInstances`?
   (Example answer): The condition that checks if the instance type is exactly `t2.nano`.
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   (Example answer): It was denied because of the `DenyEverythingExceptT2Nano` boundary statement overriding the identity policy.
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   (Example answer): Because granting star permissions means the user could accidentally delete someone else's resources if the boundary doesn't explicitly block it.
5. In two sentences: what does the boundary control that your policy cannot?
   (Example answer): A boundary sets a maximum limit on what permissions can be granted in the account. An identity policy can only grant permissions up to that predefined ceiling.
