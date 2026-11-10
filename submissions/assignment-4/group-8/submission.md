# Assignment 4 Submission

## About us

- Group number: 8
- Section: IV-CCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | 2.14 |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=3b699e5cc7f46e3c9cacf595607d385b722f14c4

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In a month with no requests, the Lab 4 serverless setup incurs almost zero cost because API Gateway and Lambda charge only when executed, leaving only a small DynamoDB fee for the stored data. In contrast, the Lab 2 EC2 setup charges for each hour the server runs and the EBS disk stores data, regardless of whether any traffic occurs.

## Recommendation

The Lab 4 serverless setup fits the message API at 1 million requests a month because it is substantially more cost-effective. Our serverless estimate totals about $2.14, whereas the single EC2 instance costs $12.51. In a month with no requests, serverless keeps only a small DynamoDB storage cost, while EC2 still charges for every hour it runs and for its EBS disk, so we would pay for idle time. Serverless also needs less work from our group, because we do not need to patch or maintain a server, and API Gateway and Lambda scale automatically during sudden traffic spikes. Ultimately, the pay-per-request model is cheaper and easier to operate for this level of traffic.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| lurrenggg | Generated the AWS cost estimates, configured the final pricing settings, and drafted the recommendation. |
| h0pSpaint | Configured the Amazon API Gateway and AWS Lambda settings in the AWS Pricing Calculator. |
| deejay-torres | Verified the Amazon DynamoDB on-demand pricing parameters and eventually consistent read settings and answered the conceptual question. |
| shamKirzon | Validated the Amazon EC2 and EBS storage configuration, reviewed the final markdown formatting, and opened the pull request. |
