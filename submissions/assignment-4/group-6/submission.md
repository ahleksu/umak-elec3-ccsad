# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 6
- Section: IV-CCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 USD |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 USD |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.20 USD |
| **Total** | | 1.86 USD |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 USD |

Share link of our estimate: Lab4- https://calculator.aws/#/estimate?id=1a83cac00f5635eef31cac1f1d3167601c47a3b8, Lab2-https://calculator.aws/#/estimate?id=7138c13d5c58114c4c8eda02434eee71b55b0544 

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 serverless setup, only the Amazon DynamoDB table storage fee remains (around 0.20 USD to 0.29 USD for 1 GB), while API Gateway, AWS Lambda, and DynamoDB read/write request costs drop to zero because they are billed strictly per invocation and per operation. In contrast, the Lab 2 EC2 setup retains all of its costs (the full 12.51 USD) because EC2 on-demand instances charge for every hour the server remains in a running state, EBS charges for the allocated 8 GB disk volume regardless of usage, and CloudWatch detailed monitoring applies fixed monthly metric fees regardless of incoming traffic.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The Lab 4 serverless setup fits our message API much better than the Lab 2 EC2 deployment. At an estimated monthly total of 1.86 USD versus 12.51 USD, serverless cuts our operating expenses by roughly 85 percent for the expected volume of 1 million requests. During idle or low-traffic periods, our answer to the question shows that serverless drops to mere fractions of a dollar for storage, whereas the EC2 instance constantly bills the full amount simply by running. Serverless also eliminates operational overhead for our group because AWS handles infrastructure management, automatic scaling, and runtime availability out of the box. Running the EC2 setup would instead require our team to manually configure system security, apply OS patches, and manage background daemon processes.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| MadBunBun | aws calculations, submission |
| kadirisubs | aws calculations walkthrough |
| malorian-arms3516 | answered assignment questions |
| keiameere | answered assignment questions, double checked md file and calculation process |

