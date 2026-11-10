# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 7
- Section: IV - CCSAD

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

Share link of our estimate: https://calculator.aws/#/estimate?id=e3c686709fff81fbdd5d2f3e2c53f024a5de2809

## Question

In a month with no requests at all, which costs remain in each setup, and why?

Lab 4 endpoint (serverless): Almost nothing remains. API Gateway and Lambda charge per request and per run time, so with zero requests they cost 0 USD. DynamoDB on-demand has no read or write charges without traffic, but we still pay for storing the data in the table, which is a small amount per GB per month. Lab 2 setup (EC2): The full cost remains, about 12.51 USD. The t3.micro instance is billed for every hour it is running, whether or not anyone uses it. The 8 GB gp3 volume and the detailed monitoring are also billed for the whole month, and the volume is billed even if the instance is stopped.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The serverless setup from Lab 4 (API Gateway, Lambda, and DynamoDB) fits our message API at 1 million requests a month. Its total is 1.86 USD, compared with 12.51 USD for the EC2 setup, so it costs about one-seventh as much. As our answer above shows, with no requests the serverless setup drops to almost nothing, while the EC2 instance keeps charging its full price because it runs all the time. Serverless also needs less work from our group, since AWS handles the servers, patching, and scaling, while on EC2 we would have to set up and secure the operating system, install and update our app, monitor it, and add a database that the 12.51 USD does not even cover. The trade-off is that serverless cost grows with every request, so we should re-run the estimate if traffic grows far beyond 1 million a month, but at our size it is the clear choice.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| rewyuu | Estimated Lab 4 Endpoint |
| LarsUlrichPons | Estimated Lab 2 |
| VobAviso | Answered the Question |
| JeromeMagno | Answered Recommendation |
