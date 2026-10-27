# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: Group 2
- Section: IV - CCSAD
- Client: A barangay health center records system
- VPC CIDR: 192.168.16.0/20

## Task 1. Equal subnets

New prefix: /22

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 192.168.16.0/22 | 192.168.16.0 | 192.168.19.255 | 1019 | 192.168.16.4 | 192.168.19.254 |
| 2 | 192.168.20.0/22 | 192.168.20.0 | 192.168.23.255 | 1019 | 192.168.20.4 | 192.168.23.254 |
| 3 | 192.168.24.0/22 | 192.168.24.0 | 192.168.27.255 | 1019 | 192.168.24.4 | 192.168.27.254 |
| 4 | 192.168.28.0/22 | 192.168.28.0 | 192.168.31.255 | 1019 | 192.168.28.4 | 192.168.31.254 |

Reserved addresses of subnet 1: 

192.168.16.0 – Network address

192.168.16.1 – VPC Router

192.168.16.2 – Amazon-provided DNS

192.168.16.3 – Reserved for future use

192.168.19.255 – Network broadcast address

Working for subnet 1:

VPC CIDR: 192.168.16.0/20
Number of equal subnets needed: 4

1. Prefix calculation:
   - New prefix = /20 + log2(4) = /20 + 2 = /22

2. Address count per subnet:
   - Total addresses = 2^(32 - 22) = 2^10 = 1,024 addresses
   - Usable addresses = 1,024 - 5 (AWS reserved) = 1,019 addresses

3. Range calculation for Subnet 1:
   - First address (Network address): 192.168.16.0
   - Last address (Broadcast address): 192.168.16.0 + 1,023 IPs = 192.168.19.255
   
4. Usable IP range calculation:
   - AWS reserves the first 4 IP addresses (.0 to .3) and the last IP address (.255).
   - First usable IP = 192.168.16.0 + 4 = 192.168.16.4
   - Last usable IP = 192.168.19.255 - 1 = 192.168.19.254

## Task 2. Subnets of a given size
Given subnet size: /24 | Target subnet number: 10
- 2a. 16 subnets of size /24 fit into the /20 VPC ($2^{24-20} = 2^4 = 16$).
- 2b. Each /24 subnet has 251 usable addresses ($256 - 5 = 251$).
- 2c. CIDR: 192.168.25.0/24. Usable range: 192.168.25.4 – 192.168.25.254

Working for 2c:

Target Subnet: Subnet #10
Subnet Size: /24 (256 addresses per subnet)

1. Block Increment Calculation:
   - Each /24 subnet contains 256 IP addresses, which increments the 3rd octet by 1.

2. Network Address Calculation:
   - Starting 3rd octet of VPC: 16
   - 3rd octet offset for Subnet 10: (10 - 1) * 1 = 9
   - Subnet 10 Network Address = 192.168.(16 + 9).0 = 192.168.25.0/24

3. Usable IP Range Calculation:
   - Network address: 192.168.25.0
   - Broadcast address: 192.168.25.255
   - First usable IP = 192.168.25.0 + 4 = 192.168.25.4 (skips 4 AWS reserved IPs: .0, .1, .2, .3)
   - Last usable IP = 192.168.25.255 - 1 = 192.168.25.254 (skips broadcast IP: .255)
   - Usable Range = 192.168.25.4 - 192.168.25.254

- 2d. CIDR block of the last subnet (Subnet 16): 192.168.31.0/24

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /24 | 192.168.16.0/24 | ap-southeast-1a | 251 |
| private-b | /24 | 192.168.17.0/24 | ap-southeast-1b | 251 |
| public-a | /25 | 192.168.18.0/25 | ap-southeast-1a | 123 |
| public-b | /25 | 192.168.18.128/25 | ap-southeast-1b | 123 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 192.168.16.128/25 | Not valid | It overlaps with the Task 3 subnet plan (private-a at 192.168.16.0/24). |
| P2 | 192.168.32.0/22 | Not valid | It lies outside the VPC CIDR range (192.168.16.0/20 ends at 192.168.31.255). |
| P3 | 192.168.29.0/25 | Valid | It is inside the VPC, starts on a valid step, has a prefix size between /16 and /28, and does not overlap with Task 3. |
| P4 | 192.168.28.128/29 | Not valid | The subnet mask /29 is invalid because AWS VPC subnets must be between /16 and /28. |
