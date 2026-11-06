# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## **About us**

- Group number: 05
- Section: IV - CCSAD
- Lab 3 client: A campus library reservation system

## **Three estimates**

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 21.01 USD |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, gp3 | 42.75 USD |
| C. Read scaling | db.t4g.micro | Single-AZ | 2, the primary and one read replica | 20 GB, gp3 | 42.02 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=39a3536b53694ccb16394332b038a2c9e0ccb69a

## **Recommendation**

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

Based on the group’s deliberation, the recommended option is the first option, Option A: db.t4g.micro instance type with a single-AZ deployment and 20 GB of General Purpose SSD (gp3) has a total monthly cost of 21.01 USD, which is significantly cheaper than the two other options. Our client has a campus library reservation system; assuming that the campus is relatively small, the system is not expected to experience extremely high demand since its primary users are mostly limited to the students and some faculty members. That’s why a single-AZ deployment should suffice to accommodate the system’s initial database requirements without incurring additional costs for another AZ configuration. However, its main disadvantage is the lack of a standby database in another Availability Zone or a fail-safe, which could mean that a failure in the primary AZ could temporarily disrupt the system’s services, affecting the availability of the library reservation services. Despite the limitation, considering the costs, target user size, client’s system, and expected workload, option A is the most practical minimum recommendation, providing both a cost-effective and decent approach for the client’s needs, while option B can be chosen if the client prioritizes high availability and reliability and if the campus has a larger population or expects an increase in its simultaneous customers/users.

## **Question**

Why is a Multi-AZ standby not the same as a read replica?  
What makes a Multi-AZ standby different from a read replica is that a Multi-AZ standby is a synchronized, passive replica designed for high availability and automatic failover in the event of the failure of the primary database. On the other hand, a read replica is an active and asynchronous copy that is created to offload read traffic and scale database performance.   
In a Multi-AZ setup, replication happens synchronously to ensure zero data losses. While the read replicas use asynchronous replication which can cause a slight lag in replication. A Multi-AZ standby automatically takes over when the primary database fails, while a read replica needs to be manually configured as a standalone primary database.   

## **Contribution**

| GitHub username | What this groupmate did |
| --- | --- |
| DeviDo2 | Lead the group and interacted with the AWS calculator |
| gracefeliciano | Provided good points during the discussion of the recommended option |
| PalattaoMekylla | Provided good points during the discussion of the recommended option |
| GlorianaSkye | Answered the given question |