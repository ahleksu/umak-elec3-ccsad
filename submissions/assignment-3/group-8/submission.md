# Assignment 3 Submission

## About us

- Group number: 8
- Section: IV-CCSAD
- Lab 3 client: An esports tournament platform

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB gp3 | 21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=cbced3c54417a3d0b743fe2b78fe0d7a9d5d4f86

## Recommendation

We recommend Option B, high availability, at USD 42.75 a month for our esports tournament platform. Our Lab 3 plan needs 5,874 usable private addresses and 1,764 public ones, so the platform serves many players, teams and viewers at the same time. If the database goes down in the middle of a live tournament match, nobody can see brackets or scores and the organizers lose the trust of the players, and Multi-AZ keeps a standby copy in a second Availability Zone that takes over automatically. Option B costs only about USD 21.74 more than Option A at USD 21.01, which is a small price compared with the cost of a stopped tournament. Option C at USD 42.02 helps with the heavy read traffic from viewers checking scores, but it does not protect us when the primary database fails, so we would add a read replica to Option B later only if the read load grows.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a hidden copy of the database in a second Availability Zone that exists only for failover: AWS keeps it up to date and switches to it automatically when the primary fails, but our application cannot send queries to it. A read replica is a separate DB instance with a copy of the data that the application can read from to share the read load, but it is built for read scaling and is not an automatic failover partner. In short, the standby gives us availability and the read replica gives us read scaling.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| shamKirzon | Built the three estimates in the calculator and opened the Pull Request |
| deejay-torres | Researched RDS, Multi-AZ and read replicas |
| h0pSpaint | Wrote the recommendation and kept time |
| lurrenggg | Checked the share link and the numbers |
