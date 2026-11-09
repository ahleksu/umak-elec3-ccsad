# Assignment 4 Submission

## About us

- Group number: 01
- Section: VI - CCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
|---|---|---:|
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | $1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | $0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | $0.48 |
| **Total** | | **$2.14** |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
|---|---|---:|
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | $12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=7dceac04ddf822caf398806e415606e9053e7215

## Question

**In a month with no requests at all, which costs remain in each setup, and why?**

In a month with no requests at all, the serverless setup will have almost no costs because API Gateway and Lambda charge based on usage, while DynamoDB may still charge for the 1 GB of stored data. The EC2 setup will still have monthly costs because the EC2 instance runs all the time, even without visitors, and EBS charges for its storage. Therefore, the serverless setup is more cost-efficient when there is little or no traffic.

## Recommendation

**Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why?**

The serverless setup is the better choice for the Lab 4 message API because its monthly cost is only $2.14, compared to $12.51 for the EC2 setup. It is cheaper because API Gateway and Lambda charge based on the number of requests and usage. Even when there are sudden increases in traffic, the serverless setup can automatically handle more requests without requiring us to manage a server. In contrast, the EC2 setup continues to cost money every month because the server runs all the time, even without visitors. The serverless setup also requires less maintenance because our group does not need to manage server updates, operating system patches, or server capacity.

## Contribution

| GitHub username | What this groupmate did |
|---|---|
| NathanielCamachoUMAK | Configured the AWS Pricing Calculator and recorded the API Gateway cost. |
| madeliiine | Configured Lambda and DynamoDB and recorded their costs. |
| flaaa01 | Configured the EC2 estimate and checked the monthly costs. |
| kcalicaa12346055-sudo | Prepared the submission file, recommendation, and final review. |
