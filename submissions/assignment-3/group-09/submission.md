# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 09
- Section: CCSAD
- Lab 3 client: 10.9.0.0/18

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 1 GiB | 32.05 USD |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 1 GiB | 64.83 USD |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 1 GiB | 64.10 USD |

Share link of our estimate: https://calculator.aws/#/createCalculator/RDSMySQL

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

We recommend Option B, Multi-AZ, for the Laundry Shop Pickup App because it provides improved database availability for customers and shop personnel. Customers depend on the application to schedule laundry pickups, check order statuses, and review their transaction history. Shop personnel also rely on the database to manage pickup schedules, update orders, and monitor laundry operations. Database downtime could interrupt bookings and order processing, potentially affecting customer satisfaction and the shop's daily operations. Although Multi-AZ costs more than Single-AZ, its automatic failover capability makes it a suitable choice when service availability is more important than minimizing database costs.

## Question

Why is a Multi-AZ standby not the same as a read replica?

Multi-AZ for the laundry shop pickup app. The application serves customers and shop personnel who rely on the database to schedule pickups, manage laundry orders, and monitor order statuses. Database downtime could interrupt booking operations and prevent staff from updating customer orders, affecting daily business activities. Multi-AZ provides a standby database in another Availability Zone and supports automatic failover, improving availability during infrastructure failures. Although it costs more than Single-AZ, this additional cost is reasonable when uninterrupted order management is important to the business.

This recommendation assumes availability is more important than minimizing database cost. Option C would be more appropriate if the application develops substantial read traffic that needs to be distributed across multiple database instances.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| eson-gcia | Coordinated the group's tasks, reviewed the assignment requirements, and checked the completeness and accuracy of the estimates. |
| Jsmnt | Prepared the assignment documentation, organized the submission, and assisted in comparing the database configurations. |
| NotLathrell | Assisted in configuring the RDS instance options and analyzing the database deployment configurations. |
| ItsuDev | Assisted in comparing database storage, read replica configurations, and monthly pricing estimates. |
