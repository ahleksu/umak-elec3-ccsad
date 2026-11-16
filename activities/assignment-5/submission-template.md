# Assignment 5 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-5/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save diagram.png in the same folder.
4. Keep your invoke URL, your API ID, every ARN, and the account number out of this folder.
5. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: <answer>
- Section: <answer>
- Group IAM user: <answer>

## Diagram

![Our Lab 5 architecture](diagram.png)

## Estimate

Asia Pacific (Singapore), one month: 100,000 page views and 5,000 posts.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon S3 | S3 Standard, 1 GB, 100,000 GET requests | <answer> |
| Amazon API Gateway | HTTP API, 0.105 million requests, 1 KB each | <answer> |
| AWS Lambda | Without Free Tier, x86, 105,000 requests, 100 ms, 128 MB | <answer> |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.005 million writes, 0.1 million eventually consistent reads | <answer> |
| **Total** | | <answer> |

Share link of our estimate: <answer>

## Ten times the traffic

With 1,000,000 page views and 50,000 posts a month, which service's monthly cost grows the most in US dollars, and why?

<answer>

## The throttle and one more improvement

Which Well-Architected pillar does the throttle on the `$default` stage serve, and why?

<answer>

One more improvement for the same architecture, and the pillar that it serves:

<answer>

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| <answer> | <answer> |
| <answer> | <answer> |
| <answer> | <answer> |
