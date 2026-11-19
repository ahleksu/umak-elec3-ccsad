# Final Exam

You take the Final Exam with your thesis group, in one of two tracks. This page has the steps, the dates, and how I score each part.

## Your section's dates

| Section | Track B written exam, Saturday, November 21 | Presentation night, 7:00 to 9:00 PM | Written exam make-up, Saturday, November 28 |
| --- | --- | --- | --- |
| IV-ACSAD | Start 7:30 to 7:45 AM, closes 9:30 AM | Thursday, November 26 | Start 7:30 to 7:45 AM, closes 9:30 AM |
| IV-BCSAD | Start 3:00 to 3:15 PM, closes 5:00 PM | Wednesday, November 25 | Start 10:30 to 10:45 AM, closes 12:30 PM |
| IV-CCSAD | Start 6:00 to 6:15 PM, closes 8:00 PM | Tuesday, November 24 | Start 6:00 to 6:15 PM, closes 8:00 PM |
| IV-DCSAD | Start 3:00 to 3:15 PM, closes 5:00 PM | Monday, November 23 | Start 3:00 to 3:15 PM, closes 5:00 PM |

## Choose your track

Your whole thesis group takes the same track. Your group representative answers the track form once for the whole group by Thursday, November 19, 11:59 PM.

| | Track A | Track B |
| --- | --- | --- |
| Who | A group whose thesis system already uses the cloud: a cloud architecture, a deployment to a cloud provider, or CI/CD | Every other group |
| Written exam | None | Yes, each member, 50 points |
| What your group makes | A PDF about your thesis system on the cloud | A small case app built in AWS, and a PDF about it |
| Presentation night | A 6-minute pitch with your live system, then 1 question for each member | A 6-minute demo of your build, then 1 question for each member |

## Track A steps

1. By Thursday, November 19, 11:59 PM: your group representative answers the track form. The form asks for your cloud provider and one sentence on what runs on the cloud.
2. Friday, November 20: I confirm your group for Track A. If I do not confirm it, your group moves to Track B, and I email you that night.
3. Saturday, November 21: no written exam for you. Prepare your PDF and your pitch.
4. Sunday, November 22, 6:00 PM: submit your PDF.
5. Your section's presentation night: present your live system and answer questions.

## Track B steps

1. By Thursday, November 19, 11:59 PM: your group representative signs in to Cumulus, our custom app, at https://main.dvexpdxf4xcm3.amplifyapp.com/roll/ and rolls your case number once. Then your representative answers the track form. The form asks for the number you rolled and a screenshot of the roll. Have the student ID of each groupmate ready, because the roll asks for every member (2 to 8 in all). If you cannot sign in, or Cumulus refuses your list, message me before 9:00 PM. The track form shows each step with pictures.
2. Within 30 minutes after your representative sends the form: every member gets the case by UMak email. I send your group's AWS lab user to your representative the same night. You can use your own AWS account instead. Then its costs are yours, and the lab user rules below do not apply.
3. Write and test your app on your laptop first, and keep the code in one Git repository for your group. Then build your case in AWS. You can use the services below. You do not need all of them. Your build must meet your case: what the app must do, the expected traffic, and the constraints. Your case email suggests a design, and you can change it.
   - VPC: your group's public and private subnets in the section VPC
   - EC2: t3.micro, t3.small, or t3.medium instances in your subnet, with your group's own security group
   - S3: the front end or the file storage
   - API Gateway, Lambda, and DynamoDB: the back end
   - IAM: your group has two ready roles, `umak-elec3-<user>-lambda-role` for your Lambda functions and `umak-elec3-<user>-ec2-role` for your instances. Each can use your own tables, buckets, and Lambda logs. Your lab user cannot change them. If you use Lambda, be ready to explain in the defense what your role allows and how you would narrow it to least privilege.

   Your lab user can do everything with your group's own resources. Use these names, or AWS refuses the action. `<user>` is your lab user name, for example `dcsad-final-07`.
   - Tag your security group, your launch template, your key pair, and your instance with `team` = `<user>`. Put the tag on the launch template itself and on the instances that it launches.
   - Start each Lambda function, table, and bucket name with `umak-elec3-<user>-`. Your HTTP API, `umak-elec3-<user>-api`, is already made. You add its routes.
   - To let an instance read your bucket or table, choose `umak-elec3-<user>-ec2-role` as its IAM instance profile.
   - Your lab user cannot make a NAT gateway or an Elastic IP, use a disk over 20 GiB, or change the section VPC, its route tables, or its subnets. If your case needs one of these, message me.

   Deploy each part from your repository: your pages to your bucket, your handler to your Lambda function. If you use EC2, put the install steps in the user data of your launch template, so that each new instance gets your app from your repository or your bucket. Putting your repository link in your PDF is recommended.
4. Saturday, November 21, in your section's block: each member takes the written exam in Cumulus.
   - It is online, from where you are. There is no Google Meet.
   - You must start within the first 15 minutes of your block. The exam closes 2 hours after the block starts.
   - The timer is 90 minutes from when you click Start. You get one attempt. Closed notes.
   - It has 65 multiple-choice and multiple-response items, in the style of the AWS Certified Cloud Practitioner exam. 50 items count for your score and 15 do not, and you will not know which ones. A wrong answer costs nothing. An unanswered item counts as wrong.
   - It covers Weeks 1 to 16.
5. Sunday, November 22, 6:00 PM: submit your PDF.
6. Your section's presentation night: demo your build and answer questions.

If you use EC2, stop your instance when you finish working, because a running instance costs money. The class account stops any instance that has run for 24 hours. Your disk and your code stay. Start the instance again in the EC2 console when you need it, and start it before your slot on your presentation night. Its public IP address changes at each start.

## The PDF

Both tracks submit one PDF, made from your track's Canva template:

- Track A template: https://canva.link/cbk2b05clr4g39x
- Track B template: https://canva.link/izks6xf5xc7qfdd

Open the link and click "Use template" to get your own copy. Each template has these pages:

- Three pages that you fill in: the cover, the architecture diagram, and the plan. A gray note on each page says what goes there. Delete each gray note when you finish the page.
- Example pages, each with "Example" at the start of its title or a red "EXAMPLE PAGE" note. They show a made-up system with the level of detail I expect. Copy the level of detail, not the content. The Track A template shows the same system twice: once on several providers (Vercel, Render, Supabase) and once on one provider (AWS). Either kind of system counts for Track A.
- A "Before You Download" checklist page.

If an answer does not fit on its page, add a page right after it and title it with "(continued)", for example "Plan (continued)". Before you download, delete every example page and the checklist page. Your PDF then has the cover, the diagram, the plan, and any "(continued)" pages.

The example diagrams were drawn in draw.io (https://app.diagrams.net) with its AWS icons. You can draw yours in draw.io, Lucidchart, or Excalidraw, then export a PNG and place it on the diagram page. Use the official icon of each service, split your diagram into tiers, and label every arrow.

| Part | Track A | Track B |
| --- | --- | --- |
| 1. Cover | Thesis title, cloud provider, members with names and student IDs | Section, case number and title, members with names and student IDs |
| 2. Architecture diagram | Your system on its provider, the network, numbered arrows for one request, the CI/CD path, a legend | The services you chose, each in the right place: anything that runs in a VPC in your subnet of the section VPC (or in your own VPC, in your own account), the other services outside it. Numbered arrows for one request, a legend |
| 3. Plan | One paragraph on what your system does and what runs on the cloud. The monthly cost with the calculator link | One row per service: the service and what it does in your case. The monthly cost with the AWS Pricing Calculator link. In 2 or 3 sentences, what breaks at ten times the users, and the fix |

- Submit it in the "Final Exam Submission" form by Sunday, November 22, 6:00 PM. I post the link in our group chat.
- Name the file `SECTION-TRACK-GROUP.pdf`, for example `DCSAD-B-07.pdf`. The file is at most 10 MB.
- I score every PDF before the presentation nights.

The IAM policy (if you use Lambda), the security groups (if you use EC2), the build order, and each member's part are not in the PDF. I ask about them in the defense.

## Presentation night

| Track | Slot | Live part | Defense |
| --- | --- | --- | --- |
| A | 11 minutes | 6 minutes: a startup-style pitch with your live system | 4 minutes: 1 question for each member |
| B | 11 minutes | 6 minutes: your working build (the app URL and each service you chose) | 4 minutes: 1 question for each member |

Each slot includes 1 minute for the next group to share its screen.

- Every student joins our Google Meet at 7:00 PM for roll call, with the camera on.
- Your display name is "Surname, First name".
- Groups present in group-number order, Track A and Track B together. Your group number is your Lab 4 group number, the one you pick in the track form. The order is fixed, so your time slot is in the table below.
- When the group before you starts, you are on deck. Have your screen ready.
- During your group's slot, every member keeps the camera on and answers aloud.
- A member with the camera off, or absent, gets 0 on the individual defense. The group still presents.
- If you drop, rejoin within your slot. If you cannot, you answer at the end of the night if time allows.
- The night is recorded. Your group can leave after its slot.

| Group | Time slot |
| --- | --- |
| 1 | 7:05 to 7:16 PM |
| 2 | 7:16 to 7:27 PM |
| 3 | 7:27 to 7:38 PM |
| 4 | 7:38 to 7:49 PM |
| 5 | 7:49 to 8:00 PM |
| 6 | 8:00 to 8:11 PM |
| 7 | 8:11 to 8:22 PM |
| 8 | 8:22 to 8:33 PM |
| 9 | 8:33 to 8:44 PM |
| 10 | 8:44 to 8:55 PM |

A section with fewer groups ends earlier. IV-CCSAD has 9 groups and IV-DCSAD has 8.

## How you are scored

### Track A, 100 points

| Part | Points | Scored from |
| --- | --- | --- |
| Architecture diagram and plan | 30 | Your PDF, before the night |
| System presentation | 30 | Your live pitch |
| Individual defense | 40 | Your own answers |

**Architecture diagram and plan, 30 points**

| Level | What it looks like | Points |
| --- | --- | --- |
| Excellent | The cover, the diagram, and the plan are complete. The diagram shows the provider, the network, numbered arrows for one request, the CI/CD path, and a legend. The plan is clear, and the calculator link opens to the cost you state. | 27 to 30 |
| Good | All parts are there, but one is unclear or has a small error. | 21 to 26 |
| Fair | One part is missing, for example the CI/CD path or the calculator link. | 15 to 20 |
| Needs work | Two or more parts are missing, or the diagram does not match your system. | 0 to 14 |

**System presentation, 30 points**

| Level | What it looks like | Points |
| --- | --- | --- |
| Excellent | The live system works on its cloud. The pitch says who it is for, what it does, and what runs on the cloud, within 6 minutes. | 27 to 30 |
| Good | The system works, with a small slip or a little over time. | 21 to 26 |
| Fair | Part of the system fails, or most of the pitch is slides and screenshots. | 15 to 20 |
| Needs work | No live system is shown. | 0 to 14 |

**Individual defense, 40 points**

You answer 1 question. I score your own answer.

| Level | What it looks like | Points |
| --- | --- | --- |
| Excellent | Your answer is correct and clear, in your own words, and you can show it in your system or your diagram. | 36 to 40 |
| Good | Your answer is correct, with a small gap. | 28 to 35 |
| Fair | Your answer is partly correct. | 20 to 27 |
| Needs work | Your answer is wrong, or you do not answer. | 0 to 19 |

### Track B, 100 points

| Part | Points | Scored from |
| --- | --- | --- |
| Written exam | 50 | Cumulus, each member |
| Architecture diagram | 10 | Your PDF, before the night |
| Plan | 10 | Your PDF, before the night |
| Working build | 20 | Your live demo |
| Individual defense | 10 | Your own answers |

**Architecture diagram, 10 points**

| Level | What it looks like | Points |
| --- | --- | --- |
| Excellent | Each service you chose is in the right place: anything that runs in a VPC is in your subnet of the section VPC (or in your own VPC, in your own account), and the other services are outside it. Numbered arrows for one request and a legend. | 9 to 10 |
| Good | All parts are there, but one is unclear or has a small error. | 7 to 8 |
| Fair | One part is missing, for example the subnets or the numbered arrows. | 5 to 6 |
| Needs work | Two or more parts are missing, or the diagram does not match your case. | 0 to 4 |

**Plan, 10 points**

| Level | What it looks like | Points |
| --- | --- | --- |
| Excellent | Every service has a row that says what it does in your case. The calculator link opens to the cost you state. The ten-times answer names what breaks and a fix that works. | 9 to 10 |
| Good | All parts are there, but one is unclear or has a small error. | 7 to 8 |
| Fair | One part is missing, for example the calculator link or the ten-times answer. | 5 to 6 |
| Needs work | Two or more parts are missing. | 0 to 4 |

**Working build, 20 points**

| Level | What it looks like | Points |
| --- | --- | --- |
| Excellent | The app URL opens and does what your case asks. You show each service you chose running, for example the items in your table, within 6 minutes. | 18 to 20 |
| Good | Everything works, with a small slip or a little over time. | 14 to 17 |
| Fair | One part does not work or cannot be shown. | 10 to 13 |
| Needs work | Two or more parts do not work, or there is no build. | 0 to 9 |

**Individual defense, 10 points**

You answer 1 question. I score your own answer.

| Level | What it looks like | Points |
| --- | --- | --- |
| Excellent | Your answer is correct and clear, in your own words, and you can show it in your build or your diagram. | 9 to 10 |
| Good | Your answer is correct, with a small gap. | 7 to 8 |
| Fair | Your answer is partly correct. | 5 to 6 |
| Needs work | Your answer is wrong, or you do not answer. | 0 to 4 |

## FAQ

**Only part of our thesis system is on the cloud. Which track?**
If any part of your system already runs on a cloud provider, or you use CI/CD, choose Track A and say in the form what runs on the cloud. I confirm on Friday, November 20. If I do not confirm, your group moves to Track B. I email you that night, you roll by Saturday, November 21, 12:00 noon, and you get your case at 1:00 PM. You take the written exam with your section, and the PDF is still due Sunday, 6:00 PM.

**Does our provider count for Track A if it is not AWS, Google Cloud, or Azure?**
Yes. A managed platform counts, for example Vercel, Netlify, Render, Railway, Supabase, or Firebase. So do AWS, Google Cloud, and Azure. In the defense, be ready to say what kind of service it is (IaaS, PaaS, or SaaS), where it runs, what it costs, and what the provider manages for you.

**Can we play a recorded pitch or demo video?**
Yes. A video is optional, and it saves time on the night. It must fit in your 6-minute live part. Share your screen with sound, and test the sound before 7:00 PM. Keep your live system open, because I can ask you to show it after the video.

**Do we need slides?**
No. Slides are optional. Whatever you show, make clear the problem your system solves, its target users, and how it runs on the cloud. Then show your live system or your build. I score your PDF before the night.

**Does every member need to speak?**
Your group decides who speaks in the pitch or the demo. During the presentation or the defense, I can call on any member, and that member must be able to answer.

**Our representative made a mistake in the track form, or we want to change our track.**
Your representative can edit the answer until Thursday, November 19, 11:59 PM. Open the track form again with the same UMak account and click Edit your response. If the form is already closed, message me.

**Can some of our members take Track A and the rest Track B?**
No. Your whole thesis group takes one track.

**Our thesis group has members from two sections. What do we do?**
Your group presents on the night of your representative's section. Each member takes the written exam in their own section's block.

**I have no thesis group. What do I do?**
You join a Track B group in your own section. I assign your group on Friday, November 20.

**We lost the screenshot of our roll.**
Type the number in the form anyway. Cumulus keeps every roll, and its record decides.

**Can we roll again for another case?**
No. Each group rolls once. A second visit shows the same number.

**It has been 30 minutes since the form, and we have no case email.**
Check your spam folder first. Then message me.

**I missed the written exam.**
A make-up is only for a documented reason, for example a medical certificate. It is on Saturday, November 28, in your section's block. Message me as soon as you can.

**My camera or my connection fails on the night.**
Test both before 7:00 PM, and keep a phone ready to join. If you drop, rejoin within your slot. If you cannot, you answer at the end of the night if time allows. A member with the camera off gets 0 on the individual defense.

**Which AWS account do we use, and how do we sign in?**
I send your group's lab user in the class AWS account (the sign-in link, the user name, and the password) to your representative on the night of your case email. You can use your own AWS account instead. Track A uses your own cloud provider.

**Do we pay for AWS?**
Not in the class account. In your own account, the costs are yours, so stop or delete what you do not use.

**Do we have to use every service in the case email?**
No. The services in the case email are a suggested design. Use any of them, in any way, as long as your build meets your case, its expected traffic, and its constraints.

**Do we build on our laptops first?**
Yes. Write and test your app on your laptop, keep the code in one Git repository, then deploy each part to AWS. This saves your AWS time for the parts that only run there.

**What do we delete after November 28?**
Nothing in the class account. Your lab user stops working on Saturday, November 28, at 11:59 PM, and I clean up the class account. Delete your saved copy of the lab password.

If your question is not here, message me.
