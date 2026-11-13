
# Assignment 3 Submission

## About us

- Group number: 1
- Section: IV - CCSAD
- Lab 3 client: A school canteen ordering app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 39.26 USD |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, gp3 | 61.00 USD |
| C. Read scaling | db.t4g.micro | Single-AZ | 2, the primary and one read replica | 20 GB,     gp3 | 78.52 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=82835df0465babf5f386d4580b29b0aed18be0f1

## Recommendation

We recommend Option B (High Availability) for the school canteen ordering app because it provides better availability for students and canteen staff. The application may have many users placing orders and checking their order status during school breaks. If the primary database fails, the Multi-AZ standby can take over and help reduce service interruption. Although it costs more than Option A, it provides better protection against downtime. Option C is more suitable if the application has a large number of read requests that need to be distributed across multiple database instances.

## Question

**Why is a Multi-AZ standby not the same as a read replica?**

A Multi-AZ standby is used for high availability and automatically takes over when the primary database fails. It is not intended to handle normal read requests from the application. On the other hand, a read replica is used to handle additional read requests by allowing the application to send some queries to another database instance. In short, Multi-AZ helps reduce downtime, while read replicas help improve read performance.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| flaaa01 | Created the Option A estimate (Small and cheap) and checked its configuration and monthly cost. |
| NathanielCamachoUMAK | Created the Option B estimate (High availability) and checked its configuration and monthly cost. |
| kcalicaa12346055-sudo | Created the Option C estimate (Read scaling) and checked its configuration and monthly cost. |
| madeliiine | Prepared the submission document, wrote the recommendation and question answers, and organized the final GitHub submission. |
