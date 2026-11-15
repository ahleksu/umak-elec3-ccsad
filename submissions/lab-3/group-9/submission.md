# Lab 3 Submission

## About us

Group number: 9
Section: IV-CCSAD
Client: A laundry shop pickup app
VPC CIDR: 10.9.0.0/18

## Task 1. Equal subnets

New prefix: `/21`

| # | CIDR | First | Last | Usable | First usable | Last usable |
|---:|---|---|---|---:|---|---|
| 1 | `10.9.0.0/21` | 10.9.0.0 | 10.9.7.255 | 2,043 | 10.9.0.4 | 10.9.7.254 |
| 2 | `10.9.8.0/21` | 10.9.8.0 | 10.9.15.255 | 2,043 | 10.9.8.4 | 10.9.15.254 |
| 3 | `10.9.16.0/21` | 10.9.16.0 | 10.9.23.255 | 2,043 | 10.9.16.4 | 10.9.23.254 |
| 4 | `10.9.24.0/21` | 10.9.24.0 | 10.9.31.255 | 2,043 | 10.9.24.4 | 10.9.31.254 |
| 5 | `10.9.32.0/21` | 10.9.32.0 | 10.9.39.255 | 2,043 | 10.9.32.4 | 10.9.39.254 |
| 6 | `10.9.40.0/21` | 10.9.40.0 | 10.9.47.255 | 2,043 | 10.9.40.4 | 10.9.47.254 |
| 7 | `10.9.48.0/21` | 10.9.48.0 | 10.9.55.255 | 2,043 | 10.9.48.4 | 10.9.55.254 |
| 8 | `10.9.56.0/21` | 10.9.56.0 | 10.9.63.255 | 2,043 | 10.9.56.4 | 10.9.63.254 |

Reserved addresses of subnet 1:`10.9.0.0`, `10.9.0.1`, `10.9.0.2`, `10.9.0.3`, and `10.9.7.255`

Working for subnet 1:

```
8 subnets = 3 extra bits, because 2^3 = 8
new prefix = /18 + 3 = /21

host bits = 32 - 21 = 11
total = 2^11 = 2,048
first = 10.9.0.0
last = first + 2,047 = 10.9.7.255
usable = 2,048 - 5 = 2,043
first usable = 10.9.0.0 + 4 = 10.9.0.4
last usable = 10.9.7.255 - 1 = 10.9.7.254
```

## Task 2. Subnets of a given size

- 2a. (2^{22-18}=2^4=16) subnets
- 2b. (2^{32-22}-5=1,024-5=1,019) usable addresses each
- 2c. CIDR: 10.9.56.0/22. Usable range: 10.9.56.4 to 10.9.59.254

Working for 2c:

```
a /22 has 1,024 addresses
each subnet covers 4 values of the third octet

subnet number 15 starts at:
(15 - 1) x 1,024 = 14,336 addresses from the start

14,336 / 256 = 56
subnet 15 starts at = 10.9.56.0
CIDR = 10.9.56.0/22
last address = 10.9.59.255
first usable = 10.9.56.4
last usable = 10.9.59.254
```

- 2d. 10.9.60.0/22

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
|---|---|---|---|---:|
| private-a | `/22` | `10.9.0.0/22` | ap-southeast-1a | 1,019 |
| private-b | `/22` | `10.9.4.0/22` | ap-southeast-1b | 1,019 |
| public-a | `/23` | `10.9.8.0/23` | ap-southeast-1a | 507 |
| public-b | `/23` | `10.9.10.0/23` | ap-southeast-1b | 507 |

Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
|---|---|---|--- |
| P1 | `10.9.64.0/20` | Not valid | It is outside the VPC because the VPC ends at `10.9.63.255`. |
| P2 | `10.9.36.0/29` | Not valid | Although it is inside the VPC and starts on a valid `/29` boundary, AWS does not allow subnet prefixes smaller than `/28`. |
| P3 | `10.9.48.0/23` | Valid | It is inside the VPC, starts on a valid `/23` boundary, uses an allowed prefix, and does not overlap any Task 3 subnet. |
| P4 | `10.9.18.46/23` | Not valid | It does not start on a valid /23 boundary. The correctly aligned /23 block containing this address is 10.9.18.0/23. |