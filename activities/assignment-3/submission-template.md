# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: Group - 2
- Section: IV - CCSAD
- Lab 3 client: A barangay health center records system

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t3.micro | Single-DB instance (Single-AZ) | 1 | 20 GB General Purpose SSD (gp3) | 21.74 USD |
| B. High availability | db.t3.medium | Multi-AZ DB instance (One primary, one standby) | 2 (Primary + Standby) | 100 GB General Purpose SSD (gp3) | 358.88 USD |
| C. Read scaling | db.t3.medium | Single-DB instance with 1 Read Replica | 2 (Primary + 1 Read Replica) | 100 GB General Purpose SSD (gp3) | 179.44 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=ec341cd225000b89a8f641906d25fdc461b527fc

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

We recommend Option B (High availability) for the barangay health center records system. The client expects a localized user base of community health workers, which requires reliable but moderate compute power rather than massive scale. Because their application is focused on balanced data entry and retrieval for patient records rather than heavy public web traffic, read replicas are unnecessary. However, downtime or data loss for a health center could severely disrupt patient care and medical tracking, fully justifying the cost of a Multi-AZ deployment. Therefore, Option B provides the best balance of essential data reliability and necessary infrastructure for critical community health services.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is designed for high availability and disaster recovery; it uses synchronous replication to ensure zero data loss, but you cannot route read traffic to it. A Read Replica is designed for performance scaling; it uses asynchronous replication allowing you to offload read-heavy queries from the primary database, but it is not an automatic failover target.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| RalphEspartero3 | Estimation on AWS Pricing Calculator |
| saromoAndreiLuis | Answered Recommendation |
| rssnjade | Provided values for estimation |
| DietherUrdas | Answered Question part |


