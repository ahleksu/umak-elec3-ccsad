# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 1
- Section: IV - CCSAD
- Client: A School canteen ordering app
- VPC CIDR: 10.66.0.0/17

## Task 1. Equal subnets

New prefix: /19

| # | CIDR | First | Last | Usable | First usable | Last usable |
|---|---|---|---|---|---|---|
| 1 | 10.66.0.0/19 | 10.66.0.0 | 10.66.31.255 | 8,187 | 10.66.0.4 | 10.66.31.254 |
| 2 | 10.66.32.0/19 | 10.66.32.0 | 10.66.63.255 | 8,187 | 10.66.32.4 | 10.66.63.254 |
| 3 | 10.66.64.0/19 | 10.66.64.0 | 10.66.95.255 | 8,187 | 10.66.64.4 | 10.66.95.254 |
| 4 | 10.66.96.0/19 | 10.66.96.0 | 10.66.127.255 | 8,187 | 10.66.96.4 | 10.66.127.254 |

Reserved addresses of subnet 1: 10.66.0.0, 10.66.0.1, 10.66.0.2, 10.66.0.3, 10.66.31.255

Working for subnet 1:


```
4 subnets = 2 extra bits, so the new prefix is /17 + 2 = /19
host bits = 32 - 19 = 13, total = 2^13 = 8,192
first = 10.66.0.0
last = first + 8,191 = 31 x 256 + 255 -> 10.66.31.255
usable = 8,192 - 5 = 8,187
first usable = 10.66.0.0 + 4 = 10.66.0.4
last usable = 10.66.31.255 - 1 = 10.66.31.254
```

## Task 2. Subnets of a given size

- 2a. Number of subnets: 64 subnets
- 2b. Usable addresses per subnet: 507 usable addresses.
- 2c. CIDR: 10.66.28.0/23. Usable range: 10.66.28.4 to 10.66.29.254
Working for 2c:

```
a /23 has 512 addresses (2 values in the 3rd octet: .28.0 to .29.255)
subnet number 15 starts at 10.66.0.0 + (15 - 1) x 512 = 10.66.28.0
last address = 10.66.29.255
usable range = 10.66.28.4 to 10.66.29.254
```

- 2d. Subnet #64 starts at 10.66.126.0/23 (running up to 10.66.127.255)

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
|---|---|---|---|---:|
| private-a | /20 | 10.66.0.0/20 | ap-southeast-1a | 4,091 |
| private-b | /20 | 10.66.16.0/20 | ap-southeast-1b | 4,091 |
| public-a | /20 | 10.66.32.0/20 | ap-southeast-1a | 4,091 |
| public-b | /20 | 10.66.48.0/20 | ap-southeast-1b | 4,091 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.66.8.0/21 | Not valid | It overlaps private-a, 10.66.0.0/20, because 10.66.8.0/21 (10.66.8.0 to 10.66.15.255) sits inside it. |
| P2 | 10.66.128.0/19 | Not valid | It is outside the VPC, which ends at 10.66.127.255. |
| P3 | 10.66.96.0/20 | Valid | It is inside the VPC, starts on a step for a /20 (96 is a multiple of 16), is between /16 and /28, and overlaps none of our Task 3 subnets. |
| P4 | 10.66.86.191/20 | Not valid | It does not start on a step for a /20. The valid block that holds the address is 10.66.80.0/20. |
