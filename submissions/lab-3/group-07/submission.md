# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 7
- Section: IV - CCSAD
- Client: A bakery delivery app
- VPC CIDR: 192.168.160.0/21
- Prefix: 21   Host bits: 11   Total addresses: 2048

## Task 1. Equal subnets

New prefix: /24
New host bits: 8
New total addresses: 256

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 192.168.160.0/24 | 192.168.160.0 | 192.168.160.255 | 251 | 192.168.160.4 | 192.168.160.254 |
| 2 | 192.168.161.0/24 | 192.168.161.0 | 192.168.161.255 | 251 | 192.168.161.4 | 192.168.161.254 |
| 3 | 192.168.162.0/24 | 192.168.162.0 | 192.168.162.255 | 251 | 192.168.162.4 | 192.168.162.254 |
| 4 | 192.168.163.0/24 | 192.168.163.0 | 192.168.163.255 | 251 | 192.168.163.4 | 192.168.163.254 |
| 5 | 192.168.164.0/24 | 192.168.164.0 | 192.168.164.255 | 251 | 192.168.164.4 | 192.168.164.254 |
| 6 | 192.168.165.0/24 | 192.168.165.0 | 192.168.165.255 | 251 | 192.168.165.4 | 192.168.165.254 |
| 7 | 192.168.166.0/24 | 192.168.166.0 | 192.168.166.255 | 251 | 192.168.166.4 | 192.168.166.254 |
| 8 | 192.168.167.0/24 | 192.168.167.0 | 192.168.167.255 | 251 | 192.168.167.4 | 192.168.167.254 |

Reserved addresses of subnet 1: 192.168.160.0, 192.168.160.1, 192.168.160.2, 192.168.160.3, 192.168.160.255

Working for subnet 1:

```
8 subnets = 3 extra bits, so the new prefix is /21 + 3 = /24
host bits = 32 - 24 = 8, total = 2^8 = 256
first = 192.168.160.0
last  = first + 255 -> 192.168.160.255
usable = 256 - 5 = 251
first usable = 192.168.160.0 + 4 = 192.168.160.4
last usable  = 192.168.160.255 - 1 = 192.168.160.254
```

## Task 2. Subnets of a given size

Subnet size: /25
Subnet number: 10

- 2a. 2^(25-21) = 16 subnets
- 2b. 128 - 5 = 123 usable addresses each
- 2c. CIDR: 192.168.164.128/25. Usable range: 192.168.164.132 to 192.168.164.254

Working for 2c:

```
a /25 has 128 addresses, so every 2 subnets moves the 3rd octet by 1
subnet number 10 starts at 192.168.160.0, add 128 for each new subnet 
then increase the third octet for the next since /24 has an address size of 256 -> 192.168.164.128
last address = 192.168.164.255
usable = 192.168.164.132 to 192.168.164.254
```

- 2d. 192.168.167.128/25

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /23 | 192.168.160.0/23 | ap-southeast-1a | 507 |
| private-b | /23 | 192.168.162.0/23 | ap-southeast-1b | 507 |
| public-a | /25 | 192.168.164.0/25 | ap-southeast-1a | 123 |
| public-b | /25 | 192.168.164.128/25 | ap-southeast-1b | 123 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 192.168.165.0/24 | Valid | It is inside the VPC, starts on a correct step for a /24, and overlaps none of the Task 3 subnets. |
| P2 | 192.168.164.50/25 | Not valid | It does not start on a step for a /25. The valid block that holds the address is 192.168.164.0/25. |
| P3 | 192.168.160.10/26 | Not valid | It overlaps with private-a (192.168.160.0/23). |
| P4 | 192.168.168.0/24 | Not valid | It is outside the VPC boundary, which ends at 192.168.167.255. |
