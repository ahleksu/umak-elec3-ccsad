# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 7
- Section: IV - CCSAD
- Lab 3 client: A bakery delivery app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB, general purpose SSD (gp3) | 21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20 GB, general purpose SSD (gp3) | 42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2 | 20 GB, general purpose SSD (gp3) | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=4b325be2d5fd3246da9e96e66d98afe74ac1bdc8

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

Option B (Multi-AZ) fits the bakery delivery app best. Customers place orders and bakers confirm deliveries around the clock, and early mornings are the busiest, so a database outage means missed orders and spoiled goods. Multi-AZ costs about $21.74 more per month than Option A ($42.75 vs $21.01), which is less than the revenue from a few lost orders. A standard bakery app has a light read load (menus and order status), so Option C’s read replica adds cost without solving a real bottleneck. Option B fails over automatically to a standby in another Availability Zone, so the app stays up without anyone having to react.

## Question

Why is a Multi-AZ standby not the same as a read replica?

They solve different problems. A Multi-AZ standby is for availability: it is a synchronous copy in another Availability Zone that your app can’t query, and RDS promotes it automatically if the primary fails, keeping the same endpoint with no data loss. A read replica is for scaling reads: it replicates asynchronously, has its own endpoint, serves read queries, and can lag behind the primary. A read replica also doesn’t fail over on its own, so you have to promote it manually.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| rewyuu  | Made the 3 estimates using AWS Calculator |
| LarsUlrichPons | Answered the recommendation |
| romeonspotify | Made the submission.md and recorded the correct details |
| VobAviso | Answered the question |
