## About us

- Group number: 06
- Section: IV-CCSAD
- Client: A dental clinic booking app
- VPC CIDR: 10.76.0.0/16

## Task 1. Equal subnets

New prefix: /19

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.76.0.0/19 | 10.76.0.0 | 10.76.31.255 | 8,187 | 10.76.0.4 | 10.76.31.254 |
| 2 | 10.76.32.0/19 | 10.76.32.0 | 10.76.63.255 | 8,187 | 10.76.32.4 | 10.76.63.254 |
| 3 | 10.76.64.0/19 | 10.76.64.0 | 10.76.95.255 | 8,187 | 10.76.64.4 | 10.76.95.254 |
| 4 | 10.76.96.0/19 | 10.76.96.0 | 10.76.127.255 | 8,187 | 10.76.96.4 | 10.76.127.254 |
| 5 | 10.76.128.0/19 | 10.76.128.0 | 10.76.159.255 | 8,187 | 10.76.128.4 | 10.76.159.254 |
| 6 | 10.76.160.0/19 | 10.76.160.0 | 10.76.191.255 | 8,187 | 10.76.160.4 | 10.76.191.254 |
| 7 | 10.76.192.0/19 | 10.76.192.0 | 10.76.223.255 | 8,187 | 10.76.192.4 | 10.76.223.254 |
| 8 | 10.76.224.0/19 | 10.76.224.0 | 10.76.255.255 | 8,187 | 10.76.224.4 | 10.76.255.254 |

Reserved addresses of subnet 1: 10.76.0.0, 10.76.0.1, 10.76.0.2, 10.76.0.3, 10.76.31.255

Working for subnet 1:

```
8 subnets = 3 extra bits, so the new prefix is /16 + 3 = /19
host bits = 32 - 19 = 13, total = 2^13 = 8,192
first = 10.76.0.0
last  = first + 8,191 = 31 x 256 + 255 -> 10.76.31.255
usable = 8,192 - 5 = 8,187
first usable = 10.76.0.0 + 4 = 10.76.0.4
last usable  = 10.76.31.255 - 1 = 10.76.31.254
```

## Task 2. Subnets of a given size

- 2a. 2^(22 - 16) = 64 subnets
- 2b. 1,024 - 5 = 1,019 usable addresses each
- 2c. CIDR: 10.76.20.0/22. Usable range: 10.76.20.4 to 10.76.23.254

Working for 2c:

```
a /22 has 1,024 addresses, so each subnet moves the 3rd octet by 4
subnet number 6 starts at 10.76.0.0 + (6 - 1) x 4 = 10.76.20.0
last address = 10.76.23.255
usable = 10.76.20.4 to 10.76.23.254
```

- 2d. 10.76.252.0/22 

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /20 | 10.76.0.0/20 | ap-southeast-1a | 4,091 |
| private-b | /20 | 10.76.16.0/20 | ap-southeast-1b | 4,091 |
| public-a | /23 | 10.76.32.0/23 | ap-southeast-1a | 507 |
| public-b | /23 | 10.76.34.0/23 | ap-southeast-1b | 507 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.76.35.0/24 | Not valid | It overlaps with the Task 3 plan because the public-b subnet already covers 10.76.34.0 to 10.76.35.255. |
| P2 | 10.76.252.0/23 | Valid | It is inside the VPC, starts on a step, is between /16 and /28, and does not overlap the Task 3 plan. |
| P3 | 10.77.0.0/18 | Not valid | It is outside the assigned VPC CIDR block of 10.76.0.0/16. |
| P4 | 10.76.102.0/30 | Not valid | It is smaller than /28, violating the requirement that subnets must be between /16 and /28. |