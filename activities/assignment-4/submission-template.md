# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: Group - 2
- Section: IV - CCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 USD |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 USD |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 USD |
| **Total** | | 2.14 USD |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=aa954f7eb44b6f331c6f3e7c358879eae2ae4286

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the serverless setup (Lab 4), Amazon API Gateway ($0.00) and AWS Lambda ($0.00) costs scale down to zero because pricing is strictly based on incoming requests and execution duration. Only DynamoDB retains a minimal baseline storage cost of ~$0.25 USD/month for maintaining the 1 GB of data in the table.

In the EC2 setup (Lab 2), the entire $12.51 USD monthly cost remains. The t3.micro instance runs continuously 24/7 under On-Demand pricing, the 8 GB EBS gp3 storage volume continuously incurs block storage fees, and detailed CloudWatch monitoring stays active regardless of web traffic volume.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The serverless setup (Lab 4) fits the message API significantly better than the EC2 setup because its monthly cost of $2.14 USD is over five times cheaper than EC2's $12.51 USD at 1 million requests. Even during idle periods with zero requests, the serverless architecture scales down to near $0 ($0.25 USD for storage), whereas the EC2 setup constantly incurs its full $12.51 USD baseline cost. Operationally, serverless eliminates administrative maintenance tasks for our group, such as OS patching, security hardening, and web server configuration. Furthermore, API Gateway and Lambda automatically handle traffic spikes without requiring manual Auto Scaling policy management. Therefore, serverless offers superior cost efficiency, seamless elasticity, and minimal maintenance overhead for this workload.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| rssnjade | Configured Amazon API Gateway and AWS Lambda in the AWS Pricing Calculator. |
| saromoAndreiLuis | Configured Amazon DynamoDB and Amazon EC2 settings in the calculator. |
| RalphEspartero3 | Drafted the response to the zero-request cost question and cost comparison analysis. |
| DietherUrdas | Wrote the 5-sentence recommendation, formatted submission.md, and created the Pull Request. |
