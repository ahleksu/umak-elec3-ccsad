# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 5
- Section: IV-CCSAD
- Client: A campus library reservation system
- VPC CIDR: 10.192.64.0/18

## Task 1. Equal subnets

New prefix: /20

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.192.64.0/20 | 10.192.64.0 | 10.192.79.255 | 4,091 | 10.192.64.4 | 10.192.79.254 |
| 2 | 10.192.80.0/20 | 10.192.80.0 | 10.192.95.255 | 4,091 | 10.192.80.4 | 10.192.95.254 |
| 3 | 10.192.96.0/20 | 10.192.96.0 | 10.192.111.255 | 4,091 | 10.192.96.4 | 10.192.111.254 |
| 4 | 10.192.112.0/20 | 10.192.112.0 | 10.192.127.255 | 4,091 | 10.192.112.4 | 10.192.127.254 |

Reserved addresses of subnet 1: 10.192.64.0, 10.192.64.1, 10.192.64.2, 10.192.64.3, 10.192.79.255

Working for subnet 1:

```
18 subnets = 2 extra bits, so the new prefix is /18 + 2 = /20
host bits = 32 - 20 = 12, total = 2 ^12 = 4,096
first = 10.192.64.0
last = first + 4, 095 = 15 x 256 + 255 -> 10.192.79.255 
usable = 4,096 - 5 = 4,091
first usable = 10.192.64.0 + 4 = 10.192.64.4
last usable = 10.192.79.255 - 1 = 10.192.79.254
```

## Task 2. Subnets of a given size

- 2a. 2^(24 - 18 ) = 64 subnets
- 2b. 256 - 5 = 251 usable addresses
- 2c. CIDR: 10.192.68.0/24. Usable range: 10.192.68.0 to 10.192.68.254

Working for 2c:

```
A /24 has 256 addresses which means each subnet moves the 3rd octet by 1 
subnet number 5 starts at 10.192.64.0 + (5 - 1) x 256 = 10.192.68.0
last address = 10.192.68.255
usable = 10.192.68.4.4 to 10.192.68.4.254
```

- 2d. 10.192.64.255/24

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /20 | 10.192.64.0/20 | ap-southeast-1a | 4,091 |
| private-b | /20 | 10.192.80.0/20 | ap-southeast-1b | 4,091 |
| public-a | /21 | 10.192.96.0/21 | ap-southeast-1a | 2,043 |
| public-b | /21 | 10.192.104.0/21 | ap-southeast-1b | 2,043 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.192.128.0/20 | Not Valid | It is outside your VPC because the VPC ends at 10.192.127.255. |
| P2 | 10.192.72.0/21 | Not Valid | It overlaps private-a, which covers 10.192.64.0–10.192.79.255. |
| P3 | 10.192.120.0/21 | Valid | It is inside the VPC, is an allowed /21, starts on a proper step, and does not overlap your Task 3 plan. |
| P4 | 10.192.112.0/29 | Not Valid | It is outside of the given prefix range which is between /16 and /28 |
