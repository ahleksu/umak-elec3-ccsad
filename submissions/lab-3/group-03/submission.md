# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: **03**
- Section: **IV-CCSAD**
- Client: **A jeepney fleet tracking service**
- VPC CIDR: ```172.23.48.0/20```

## Task 1. Equal subnets

New prefix: ``` /23 ```

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | ```172.23.48.0/23``` | ```172.23.48.0``` |  ```172.23.49.255```  |  ```507```  |  ```172.23.48.4```  |  ``` 172.23.49.254```  |
| 2 | ```172.23.50.0/23``` | ```172.23.50.0``` |  ```172.23.51.255```  |  ```507```  |  ```172.23.50.4```  |  ``` 172.23.51.254```  |
| 3 | ```172.23.52.0/23``` | ```172.23.52.0``` |  ```172.23.53.255```  |  ```507```  |  ```172.23.52.4```  |  ``` 172.23.53.254```  |
| 4 | ```172.23.54.0/23``` | ```172.23.54.0``` |  ```172.23.55.255```  |  ```507```  |  ```172.23.54.4```  |  ``` 172.23.55.254```  |
| 5 | ```172.23.56.0/23``` | ```172.23.56.0``` |  ```172.23.57.255```  |  ```507```  |  ```172.23.56.4```  |  ``` 172.23.57.254```  |
| 6 | ```172.23.58.0/23``` | ```172.23.58.0``` |  ```172.23.59.255```  |  ```507```  |  ```172.23.58.4```  |  ``` 172.23.59.254```  |
| 7 | ```172.23.60.0/23``` | ```172.23.60.0``` |  ```172.23.61.255```  |  ```507```  |  ```172.23.60.4```  |  ``` 172.23.61.254```  |
| 8 | ```172.23.62.0/23``` | ```172.23.62.0``` |  ```172.23.63.255```  |  ```507```  |  ```172.23.62.4```  |  ``` 172.23.63.254```  |



Reserved addresses of subnet 1: |```172.23.48.0``` | ```172.23.48.1``` |  ```172.23.48.2```  |  ```172.23.48.3```  |  ``` 172.23.49.255```  |

Working for subnet 1:

```
8 subnets = 3 extra bits, so the new prefix is /20 + 3 = /23
host bits = 32 - 23 = 9, total = 2^9 = 512
first = 172.23.48.0
last  = first + 511 = 1 x 256 + 255 -> 172.23.49.255
usable = 512 - 5 = 507
first usable = 172.23.48.0 + 4 = 172.23.48.4
last usable  = 172.23.49.255 - 1 = 172.23.49.254
```

## Task 2. Subnets of a given size

- 2a. ```2^(25-20) = 32 subnets```
- 2b. ```128 - 5 = 123 usable subnet each```
- 2c. CIDR: ```172.23.53.128/25```. Usable range: ```172.23.53.132 to 172.29.53.254```

Working for 2c:

```
a /25 has 128 addresses, so each third octet contains two /25 subnets
subnet number 12 has 11 subnets before it
subnet number 12 starts at 172.23.48.0 + (12 - 1) x 128 = 172.23.53.128
last address = 172.23.53.255
usable = 172.23.53.132 to 172.23.53.254
```

- 2d. ```172.23.63.128/25```
## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /22 | 172.23.48.0/22 | ap-southeast-1a | 1,019 |
| private-b | /22 | 172.23.52.0/22 | ap-southeast-1b | 1,019 |
| public-a | /25 | 172.23.56.0/25 | ap-southeast-1a | 123 |
| public-b | /25 | 172.23.56.128/25 | ap-southeast-1b | 123 |
## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 172.23.54.0/24 | Not valid | It overlaps private-b (172.23.52.0/22) from Task 3. |
| P2 | 172.23.58.0/30 | Not valid | A /30 is smaller than the permitted AWS subnet prefix range of /16 to /28. |
| P3 | 172.23.63.0/25 | Valid | It is inside the VPC, starts on a valid /25 step, has an allowed prefix, and does not overlap any Task 3 subnet. |
| P4 | 172.23.64.0/22 | Not valid | It is outside the VPC, which ends at 172.23.63.255. |

