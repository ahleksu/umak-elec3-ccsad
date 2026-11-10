# Lab 1 Submission

## Part B
**Error Action Name:**
<Instance launch failed
You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g09 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap- southeast-1:548387266019-security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action. >

**Screenshot (Part B launch denial with username visible):**
( <img width="1913" height="662" alt="part b ss" src="https://github.com/user-attachments/assets/66fda768-7f0d-4fff-ab86-90d7bc4984de" /> )

## Part C
**Policy Statement Blanks:**
- `"Action"`: `ec2:RunInstances`
- `"Resource"`: `arn:aws:ec2:ap-southeast-1:548387266019:instance`
- `"ec2:InstanceType"`: `t3.micro`

## Part D

**Running Instance Time:** 2026/09/22 20:44 GMT+8

**Screenshot 1 (Permissions tab listing ccsad-g09-launch):**
<img width="1905" height="747" alt="Permissions tab" src="https://github.com/user-attachments/assets/c956b5f2-1416-4c28-bc3e-29c24aeb019a" />

**Screenshot 2 (Instance in Running state):**

<img width="480" height="369" alt="part-e-cloudtrail" src="https://github.com/user-attachments/assets/449afd88-1929-4747-b02a-d98e32cf4388" />

## Part E
**t3.small / Tokyo Denial Error:**
<Instance launch failed You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g09 
is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* 
with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary.>

**Screenshot 1 (t3.small or Tokyo denial):**
![Boundary Denial] 
<img width="1250" height="1003" alt="image" src="https://github.com/user-attachments/assets/dc76b048-9e89-4bc3-b7eb-450103c104b6" />


**Screenshot 2 (CloudTrail event showing errorMessage):**
![CloudTrail Event]
<img width="1913" height="662" alt="part b ss" src="https://github.com/user-attachments/assets/e4aaad9c-9ef9-40b4-b4d6-d5bd44b896c7" />
 <img width="480" height="369" alt="part-e-cloudtrail" src="https://github.com/user-attachments/assets/661082ce-019e-4b8a-bd80-3a11eed5b5ff" />
 

## Part F Questions
1. Which action did the Part B error name?
   <ec2:RunInstances.>
2. In your policy, which condition limits `ec2:RunInstances`?
   <the Condition block checking ec2:InstanceType equals t3.micro.>
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   <because the permissions boundary's DenyAnyInstanceTypeButT3Micro statement is an explicit deny that overrides any allow, no matter how broad your identity-based policy is.>
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   < it grants far more than needed (violates least privilege); the boundary happens to catch this specific case, but you shouldn't rely on a boundary as your only real control — if the boundary were ever loosened or misconfigured, this policy alone would let you do essentially anything with EC2.>
5. In two sentences: what does the boundary control that your policy cannot?
   <the boundary sets the maximum possible permissions regardless of what any attached policy grants — it's an org-level guardrail, while your identity policy only grants what's allowed within that ceiling.>
