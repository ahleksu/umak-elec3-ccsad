# Assignment 3 Submission

## About us

- Group number: 03
- Section: IV-CCSAD
- Lab 3 client: A jeepney fleet tracking service
- Selected option: B — High availability.
- Planning assumption: The case gives no real traffic or uptime targets; this plan treats service availability as important and does not claim the instance size has been tested for a real fleet.

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

Monthly totals below were captured from the actual calculator on 2026-11-03. These are estimates, not bills.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB gp3 per instance | 21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20 GB gp3 per instance | 42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2 | 20 GB gp3 per instance | 42.02 |

The Nodes field is 1 for Option B, as required by the brief. Option C uses 2 nodes for the primary and one read replica.

Share link of our estimate: https://calculator.aws/#/estimate?id=83976b52c2eac426a44535751b2f8e11210a3afd

## Recommendation

We recommend Option B for the jeepney fleet tracking service because fleet staff and dispatchers need reliable access to vehicle locations.
Database downtime could delay their work and waste staff time, so we choose better availability over the lower cost of Option A.
At an estimated USD 42.75 per month, its Multi-AZ setup lets RDS automatically switch to a standby database if the main database fails.[1]
Option C can help with heavy dashboard reads, but its read replica does not give the primary the same automatic failover protection.[1][2]
We would measure the actual read load and server capacity before adding a read replica or choosing a larger instance.

## Question

Why is a Multi-AZ standby not the same as a read replica?

In the Multi-AZ setup used here, a standby is for keeping the database available. RDS keeps it in another Availability Zone, updates it synchronously, and can automatically switch to it if the main database fails. The standby does not handle the app's read queries.[1]

A read replica is for handling more read queries. It receives updates asynchronously, so its data can be a little behind the main database. If the primary fails, it needs a separate promotion step to become a writable database instead of taking over automatically like the standby.[2]

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| dcchristine | Wrote and reviewed the five-sentence recommendation for the jeepney client. |
| salgadojamesvan | Checked the settings and monthly costs of all three options and reviewed the comparison table. |
| yajiiiii | Wrote and checked the answer about Multi-AZ standby and read replicas. |
| Tajarros-Zed | Prepared the file, shared the calculator estimate, verified the link in a private browser, and checked the final report. |

## Sources

[1] https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZSingleStandby.html
[2] https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html
