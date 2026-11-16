# Assignment 3 Submission

## About us

- Group number: 4
- Section: IV-CCSAD
- Lab 3 client: A sari-sari store point-of-sale chain

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB, gp3 | 21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20 GB, gp3 | 42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2 | 20 GB, gp3 | 42.02 |

LINK: https://calculator.aws/#/estimate?id=9b8a7c7458781a2d9ecc18e40501059dd2b6dede

## Recommendation

We recommend Option B, the Multi-AZ deployment at USD 42.75 per month, for the sari-sari store point-of-sale chain. Cashiers across the stores need the database to record sales and check inventory while serving customers. If the database goes down, stores may lose sales and fall behind on inventory records. The Multi-AZ standby provides automatic failover if the primary database or its Availability Zone fails, for USD 21.74 more per month than Option A. The case does not specify a heavy read workload, so Option C's read replica offers less value to this client than Option B's availability.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is synchronously updated and used for automatic failover, it does not serve read queries. A read replica is updated asynchronously and serves read-only queries to reduce the primary database's load, but it does not provide the same automatic failover.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| StDevRhenz | Option A estimate and combined estimate share link |
| ScarlettRed6 | Option C read scaling estimate |
| paupausiopau | Five-sentence recommendation, Multi-AZ question, and submission write-up |
| Andre-Arcilla | Option B high availability estimate |
