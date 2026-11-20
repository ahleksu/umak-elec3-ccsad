# Assignment 4 Submission

## About us

- Group number: 9
- Section: IV-CCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | **2.14** |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=d305ba04185578b283b2648334ce51820228fbc7

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 serverless setup, almost nothing remains. API Gateway charges only per request, and Lambda charges only per run and per millisecond of run time, so both drop to 0.00 USD with no traffic. The only cost left is DynamoDB data storage for the 1 GB table, about 0.29 USD a month, because DynamoDB bills for stored data whether or not anyone reads or writes it. In the Lab 2 setup, the full 12.51 USD remains. EC2 bills for every hour that the t3.micro instance runs, about 9.64 USD, and the instance runs all month with or without visitors. The 8 GB gp3 EBS volume, about 0.77 USD, is billed for the space that it holds, and detailed monitoring, about 2.10 USD, is billed per metric every month.

## Recommendation

We recommend the serverless setup of API Gateway, Lambda, and DynamoDB for the Lab 4 message API at 1 million requests a month. It costs 2.14 USD a month, while the Lab 2 EC2 setup costs 12.51 USD, so the EC2 setup is almost six times more expensive for the same traffic. In a month with no requests, the serverless setup drops to only the DynamoDB storage cost, but the EC2 setup still charges the full 12.51 USD because the instance, its disk, and its monitoring are billed by time, not by use. With serverless, AWS runs and patches the servers and scales Lambda for a sudden spike in traffic, while with EC2 our group would have to patch the operating system and manage the Auto Scaling group ourselves. For a small API with uneven traffic, the serverless setup is both cheaper and less work for our group.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Jsmnt | Built both estimates in the AWS Pricing Calculator (API Gateway, Lambda, DynamoDB, and EC2), checked every setting, created the share link, and wrote this submission |
