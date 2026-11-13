# Assignment 4 Submission

## About us

- Group number: 4
- Section: IV-CCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | $1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | $0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | $0.48 |
| **Total** | | **$2.14** |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | $12.51 |

link of our estimate: https://calculator.aws/#/estimate?id=97d1f77184ed1a1fa971f7aa425776b3848897f2

## Question

In a month with no requests at all, which costs remain in each setup, and why?

With no requests, the serverless setup still pays for its 1 GB of DynamoDB storage, but API Gateway and Lambda have no request or execution charges. The EC2 setup still pays for the running instance, 8 GB of EBS storage, and detailed monitoring because those resources stay on all month.

## Recommendation

For our Lab 4 message API at one million requests per month, we recommend the serverless setup. Its estimated monthly cost is $2.14, compared with $12.51 for the EC2 setup. With no requests, serverless still pays for DynamoDB storage, while EC2 keeps charging for the instance, EBS storage, and detailed monitoring. Serverless saves our group from patching and managing a server. API Gateway and Lambda can also handle a sudden traffic spike without us resizing an EC2 instance.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| StDevRhenz | Recorded the costs, wrote `submission.md` and checked the share link.|
| Andre-Arcilla | Calculated the API Gateway and Lambda costs. |
| paupausiopau | Calculated the DynamoDB cost. |
| ScarlettRed6 | Calculated the EC2 cost |
