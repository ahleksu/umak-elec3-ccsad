# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: RalphEspartero3
- Section: IV-CCSAD
- IAM user name that I signed in with: ccsad-g02
- X: 108

---

## Part A. Explore

### A1. The VPC

Default VPC IPv4 CIDR:

172.31.0.0/16

Number of addresses in that CIDR:

65,536

### A2. The subnets

| Availability Zone | IPv4 CIDR |
| --- | --- |
| ap-southeast-1a | 172.31.32.0/20 |
| ap-southeast-1b | 172.31.16.0/20 |
| ap-southeast-1c | 172.31.0.0/20 |

Screenshot 1. Save it as `screenshot-1-subnets.png` in your folder. The image line below shows it.


<img width="1365" height="371" alt="screenshot-1-subnets" src="https://github.com/user-attachments/assets/98136e82-86ba-4a44-9e1d-c38c492ce390" />


### A3. Available addresses

Available IPv4 addresses in each subnet:

ap-southeast-1a - 4090,
ap-southeast-1b - 4091,
ap-southeast-1c - 4091


Why is the number lower than 4,096?

The count is below 4,096 because AWS automatically reserves 5 IP addresses per subnet for internal network management.

What uses the missing address in the subnet with the lowest number?

The additional missing address in ap-southeast-1a is occupied by an active resource or network interface, such as an EC2 instance, NAT Gateway, or Load Balancer.

### A4. The route table

| Destination | Target |
| --- | --- |
| 0.0.0.0/0 | igw-0943e7e6f88293168 |
| 172.31.0.0/16 | local |

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

<img width="1149" height="597" alt="ae9a1820-5e03-4163-beec-63c2213bb87e" src="https://github.com/user-attachments/assets/4ac01a29-93ba-490a-8f86-5a2851d6ab78" />

### A5. Public or private

Are the default subnets public or private? Which route proves it?

The default subnets are public, which is proven by the route directing destination 0.0.0.0/0 to an Internet Gateway (igw-0943e7e6f88293168)

### A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

If it is detached, the default subnets will lose direct internet access and effectively become private subnets.

### A7. NAT gateways

Number of NAT gateways: 

0

Can a server in a new private subnet download updates? Why?


No. Without a NAT gateway to route outbound traffic, servers in a private subnet have no way to access the internet to download updates or software packages.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| * | 0.0.0.0/0 | Deny |

How is a network ACL different from a security group?

Unlike a stateful security group that operates at the instance level with allow-only rules, a network ACL operates at the subnet level, is stateless, and evaluates explicit allow and deny rules in numbered order.

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

<img width="1174" height="596" alt="image" src="https://github.com/user-attachments/assets/76a2b82f-93e9-4822-b7bf-def6657776d9" />


### A9. The default security group

Inbound rule (type and source):

All traffic, from sg-0c5b6d4081cf0a534. The source is the default security group itself.

Which resources can send traffic to an instance that uses it?

Only resources (such as EC2 instances or elastic network interfaces) that are explicitly assigned to that same security group (sg-0c5b6d4081cf0a534) can send traffic to the instance.

---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.108.0.0/24
- Private subnet CIDR: 10.108.1.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.108.0.0/16 | local |
| 0.0.0.0/0 | internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.108.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

draw.io

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

<img width="762" height="542" alt="vpc-diagram drawio" src="https://github.com/user-attachments/assets/ef43df4f-f51d-40ad-853f-37a517b306a1" />

### B4. Predict a change

Can you still open the web page from your laptop? Why?

No. Deleting the 0.0.0.0/0 route removes the path to the Internet Gateway, preventing inbound traffic from the internet (your laptop) from reaching the instance.

Can the instance still reach another instance in the VPC? Why?

Yes. The local route (10.108.0.0/16 -> local) remains active, allowing internal traffic within the VPC CIDR block.

### B5. Place a database

Which subnet gets the database? Why?

Private Subnet (10.108.1.0/24). Placing a database in a private subnet prevents direct inbound internet exposure, protecting sensitive data while remaining accessible to backend servers in the public subnet.

### B6. My question about VPCs

What is your question, and what made you think of it?

How does a NAT Gateway let response traffic back in while still blocking new connections from the internet? Seeing that private subnets block direct internet access made me wonder how outbound download traffic safely gets back in.
