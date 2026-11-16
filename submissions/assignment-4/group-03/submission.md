# Assignment 4 Submission

## About us

- Group number: 03
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

Share link of our estimate: https://calculator.aws/#/estimate?id=63b812ab128403f5b20ff1e16795bd412760be84

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 setup, only the DynamoDB storage cost for our 1 GB of data remains. API Gateway charges per request, Lambda charges per run and run time, and on-demand DynamoDB charges per read and write, so with no requests these three charge nothing for traffic, while stored data is billed every month. In the Lab 2 setup, the whole USD 12.51 remains. The `t3.micro` instance is billed for every hour that it runs, the 8 GB gp3 EBS volume is billed every month, and detailed monitoring is billed while it is enabled, with or without visitors.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We recommend the serverless Lab 4 setup with API Gateway, Lambda, and DynamoDB for the message API at 1 million requests a month. It costs about USD 2.14 a month, while the Lab 2 EC2 setup costs about USD 12.51 a month, so the serverless setup is almost six times cheaper at this traffic. In a month with no requests, the serverless setup only keeps the small DynamoDB storage cost, while the EC2 setup still charges the full USD 12.51 because the instance, its disk, and its monitoring are billed all month. Our group would also do less work, because AWS runs and patches the servers behind Lambda, while with EC2 we would have to patch the operating system and keep the instance healthy ourselves. When traffic suddenly spikes, Lambda and on-demand DynamoDB scale by themselves, while one `t3.micro` instance could slow down until the Auto Scaling group launches another instance and adds more hourly cost.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| dcchristine | Priced Amazon API Gateway and AWS Lambda in the calculator with the given settings. |
| salgadojamesvan | Priced Amazon DynamoDB on-demand and checked that the upfront cost is 0.00 USD. |
| yajiiiii | Priced the Lab 2 EC2 setup and checked the share link in a private browser window. |
| Tajarros-Zed | Wrote the answer to the question and the recommendation, and prepared `submission.md`. |
