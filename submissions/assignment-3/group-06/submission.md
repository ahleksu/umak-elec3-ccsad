# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 06
- Section: IV-CCSAD
- Lab 3 client: dental clinic booking app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20GB, gp3 | US$21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20GB, gp3 | US$42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2 | 20GB, gp3 | US$42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=0084603aee0a0d4d3d0aedba56365636ee5499f7

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.


The second option, `B. High Availability` would be the best fit for our dental clinic booking app client because patients and clinic staff always need reliable access to appointment schedules and booking records. In the case of the primary database becoming unavailable or unreachable, patients may fail to book or change appointments and staff may lose access to crucial scheduling information. Patients that check their appointment schedules will make read requests but we don't know if there will be enough to need a read replica. If the application needs to handle more read requests, option `C. Read Scaling` would be a preferable choice.

## Question

Why is a Multi-AZ standby not the same as a read replica?

Applications cannot use a Multi-AZ standby to serve read queries during regular operation, but it is kept up to date for high availability and automatic failover in the event that the primary instance fails. Although its data may lag behind the primary, a read replica is a different database instance that can scale read capacity by handling read-only queries. To put it simply, a read replica is used for read scaling, whereas a standby is used for availability.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| malorian-arms3516 | Estimate creation, sharing estimate link |
| keiameere | Assisted in estimate creation, double-checking information |
| kadirisubs | Assisted in answering Recommendation |
| madbunbun | Assisted in answering Question |
