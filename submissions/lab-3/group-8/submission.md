# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 8
- Section: IV-CCSAD
- Client: An esports tournament platform
- VPC CIDR: 10.175.128.0/17

## Task 1. Equal subnets

New prefix: /19

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.175.128.0/19 | 10.175.128.0 | 10.175.159.255 | 8,187 | 10.175.128.4 | 10.175.159.254 |
| 2 | 10.175.160.0/19 | 10.175.160.0 | 10.175.191.255 | 8,187 | 10.175.160.4 | 10.175.191.254 |
| 3 | 10.175.192.0/19 | 10.175.192.0 | 10.175.223.255 | 8,187 | 10.175.192.4 | 10.175.223.254 |
| 4 | 10.175.224.0/19 | 10.175.224.0 | 10.175.255.255 | 8,187 | 10.175.224.4 | 10.175.255.254 |

Reserved addresses of subnet 1: 10.175.128.0, 10.175.128.1, 10.175.128.2, 10.175.128.3, 10.175.159.255

Working for subnet 1:

```
4 subnets = 2 extra bits, so the new prefix is /17 + 2 = /19
host bits = 32 - 19 = 13, total = 2^13 = 8,192
first = 10.175.128.0
last  = first + 8,191 = 31 x 256 + 255 -> 3rd octet 128 + 31 = 159, so 10.175.159.255
usable = 8,192 - 5 = 8,187
first usable = 10.175.128.0 + 4 = 10.175.128.4
last usable  = 10.175.159.255 - 1 = 10.175.159.254
```

## Task 2. Subnets of a given size

- 2a. 2^(22 - 17) = 32 subnets
- 2b. 1,024 - 5 = 1,019 usable addresses each
- 2c. CIDR: 10.175.244.0/22. Usable range: 10.175.244.4 to 10.175.247.254

Working for 2c:

```
a /22 has 2^10 = 1,024 addresses, so each subnet moves the 3rd octet by 4
subnet number 30 starts at 10.175.128.0 + (30 - 1) x 1,024
  = 3rd octet 128 + 29 x 4 = 128 + 116 = 244 -> 10.175.244.0
last address = 10.175.247.255
usable = 10.175.244.4 to 10.175.247.254
```

- 2d. 10.175.252.0/22

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /19 | 10.175.128.0/19 | ap-southeast-1a | 8,187 |
| private-b | /19 | 10.175.160.0/19 | ap-southeast-1b | 8,187 |
| public-a | /21 | 10.175.192.0/21 | ap-southeast-1a | 2,043 |
| public-b | /21 | 10.175.200.0/21 | ap-southeast-1b | 2,043 |

Sizing: a /20 has 4,091 usable, which is less than 5,874, and a /19 has 8,187, so each private subnet is a /19. A /22 has 1,019 usable, which is less than 1,764, and a /21 has 2,043, so each public subnet is a /21.

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.175.234.47/21 | Not valid | It does not start on a step for a /21 (the 3rd octet must be a multiple of 8). The valid block that holds the address is 10.175.232.0/21. |
| P2 | 10.175.248.0/21 | Valid | It is inside the VPC, starts on a step, is between /16 and /28, and overlaps none of our Task 3 subnets. |
| P3 | 10.175.176.0/20 | Not valid | It overlaps private-b, 10.175.160.0/19. |
| P4 | 10.175.224.0/30 | Not valid | A /30 is smaller than /28, the smallest subnet that AWS allows. |
