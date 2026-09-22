# Lab 1 Submission

## Part B
**Error Action Name:** <paste error text and bold the action>

**Screenshot (Part B launch denial with username visible):**
![Part B Error](part-b-error.png)

## Part C
**Policy Statement Blanks:**
- `"Action"`: <answer>
- `"Resource"`: <answer>
- `"ec2:InstanceType"`: <answer>

## Part D
**Security Group Error Text:** <paste error text>

**Running Instance Time:** <write time here>

**Screenshot 1 (Permissions tab listing <user>-launch):**
![Permissions Tab](part-d-policy.png)

**Screenshot 2 (Instance in Running state):**
![Running Instance](part-d-instance.png)

## Part E
**t3.small / Tokyo Denial Error:** <paste error text>

**Screenshot 1 (t3.small or Tokyo denial):**
![Boundary Denial](part-e-denial.png)

**Screenshot 2 (CloudTrail event showing errorMessage):**
![CloudTrail Event](part-e-cloudtrail.png)

## Part F Questions
1. Which action did the Part B error name?
   <answer>
2. In your policy, which condition limits `ec2:RunInstances`?
   <answer>
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   <answer>
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   <answer>
5. In two sentences: what does the boundary control that your policy cannot?
   <answer>
