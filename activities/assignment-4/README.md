# Assignment 4: Price the Serverless Endpoint

This is a self-guided activity. A serverless API (application programming interface) costs money for each request. A server costs money for each hour that it runs. So the cheaper choice depends on the traffic. Your group prices your [Lab 4](../lab-4/README.md) endpoint at 1 million requests a month, prices the [Lab 2](../lab-2/lab.md) EC2 setup for the same month, and recommends one.

Work through this page first. It explains the ideas and the numbers that you enter. Then follow the steps in [`assignment.md`](assignment.md).

## What you do

This is group work. You do not sign in to AWS. Your group submits one Pull Request.

1. Open the AWS Pricing Calculator at <https://calculator.aws>.
2. Price the Lab 4 endpoint in Asia Pacific (Singapore): Amazon API Gateway, AWS Lambda, and Amazon DynamoDB.
3. Price the Lab 2 setup: one `t3.micro` EC2 instance that runs all month.
4. Save the estimate and copy its share link.
5. Answer one question, and recommend one setup in five sentences.

You create nothing in AWS, so this assignment costs nothing.

## Key ideas

### Pay per request and pay per hour

Your Lab 4 endpoint has no server that runs all the time. API Gateway charges for each request. Lambda charges for each run and for its run time. DynamoDB on-demand charges for each read and write, and for stored data. With no traffic, almost nothing is charged.

Your Lab 2 instance ran all the time. EC2 charges for each hour that an instance runs, and Amazon EBS (Elastic Block Store) charges for its disk every month, with or without traffic.

### What 1 million requests a month means

A month of 30 days has 2,592,000 seconds. 1 million requests a month is about one request every 2.6 seconds on average. Real traffic comes in peaks, but the monthly bill counts the total.

### The numbers that you enter

These assumptions describe the Lab 4 message API at 1 million requests a month:

| Assumption | Value | Why |
| --- | --- | --- |
| Requests a month | 1,000,000 | The traffic to price |
| Request mix | 800,000 GET and 200,000 POST | Most visitors read messages. Fewer post |
| Lambda memory | 128 MB | The default, the same as your Lab 4 function |
| Lambda average duration | 100 ms | A round number that leaves room for cold starts. Compare it with the Duration in your own REPORT lines |
| Item size | 1 KB | One message with its `id`, `author`, `text`, and `createdAt` is smaller than 1 KB |
| Data stored | 1 GB | 200,000 new messages of 1 KB add about 0.2 GB a month. 1 GB covers a few months |

Your `GET /messages` route scans the whole table, so each GET reads more as the table grows. This assignment assumes that each GET reads one item of 1 KB, as if the table stayed small. Lab 4, question 3, asks what changes when it grows.

### The free tier

The Lambda page of the calculator offers an estimate with or without the free tier. Choose **Lambda Function - Without Free Tier**. Every function in an AWS account shares the same free tier, so a real application cannot count on it. The API Gateway and DynamoDB pages already leave out the free tier.

### Check every field

The calculator fills in its own defaults, and some of them are wrong for this assignment. When I opened it on November 3, the DynamoDB page started with provisioned capacity, not on-demand, at USD 205.20 upfront and USD 29.83 a month. The EC2 page started with a `t4g.nano` instance and a 3-year Compute Savings Plan, not On-Demand. Read every field before you trust a total.

### What the estimates leave out

Lab 2 had no load balancer, so the EC2 estimate has none. Both estimates leave out data transfer to the internet, which is small at this traffic. The EC2 estimate also leaves out the public IPv4 address of the instance, its address on the internet, which AWS charges by the hour.

## How you submit

Submit one Pull Request per group to this repository. Then one groupmate submits the Pull Request link in the Google Form: https://forms.gle/rJ65gHyxdz6UCzC99. Both are due on Monday, November 9, 2026, at 11:59 PM (Asia/Manila).

## Files in this folder

| File | What it is |
| --- | --- |
| [`README.md`](README.md) | This page: what you do, the ideas behind the price, and the numbers that you enter. |
| [`assignment.md`](assignment.md) | The calculator steps for the two estimates, what to submit, and the scoring. |
| [`submission-template.md`](submission-template.md) | Every item to submit, with an `<answer>` placeholder. Copy it to your submission folder as `submission.md`. |
