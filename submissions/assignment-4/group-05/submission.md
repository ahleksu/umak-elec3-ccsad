# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 05
- Section: IV-CCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 USD |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 USD |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 USD |
| **Total** | | 49.66 USD |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 9.64 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=0656891c77016a63ec6e2f33cfed656f53b6ff6d

## Question

In a month with no requests at all, which costs remain in each setup, and why?

Lab 4 (Serverless Message API): The total fixed cost is effectively $0.00 for compute and API handling. API Gateway HTTP APIs have no minimum fees—you pay only for calls received, so zero requests equal zero cost. AWS Lambda's permanent free tier includes 1 million requests and 400,000 GB-seconds per month, so idle functions incur no charge. The only remaining cost is DynamoDB storage: on-demand tables are not billed for throughput when traffic is zero, but the 1 GB of stored data is still charged at roughly $0.25–$0.28 per GB-month.

Lab 2 (EC2 Setup): The entire $9.64 remains payable even with zero requests. The t3.micro instance is billed per hour while it is running, regardless of utilization. The attached 8 GB gp3 EBS volume is billed per GB-month regardless of I/O activity (~$0.64 at $0.08/GB-month). Detailed monitoring is also a recurring per-instance charge that remains active as long as it is enabled. In short, Lab 2 is a provisioned resource: you pay for capacity, not consumption

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The Lab 4 endpoint setup is the better choice for our Message API because it offers a serverless architecture despite its higher estimated monthly cost of $49.66, compared to Lab 2's $9.64. Lab 4 charges based on API requests and resource usage, while DynamoDB storage remains chargeable even when there are no requests. In contrast, Lab 2 continues charging for the EC2 instance, storage, and monitoring even when idle. Lab 4 requires our group to configure API Gateway, Lambda, and DynamoDB, while Lab 2 requires us to manage and maintain the EC2 server. Overall, we choose Lab 4 because it reduces server maintenance and provides a more scalable setup for our Message API.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| DeviDo2 | Lead the group and submitted the submission.md |
| gracefeliciano | Guided the user of the AWS Calculator and filled out the items |
| PalattaoMekylla | Guided the user of the AWS Calculator and filled out the items |
| GlorianaSkye | Interacted with the AWS Calculator |
