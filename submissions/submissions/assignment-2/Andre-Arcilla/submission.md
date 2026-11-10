# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: Andre-Arcilla
- Section: IV-CCSAD
- IAM user name that I signed in with: ccsad-g04
- X: 169

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
| apse1-az2 (ap-southeast-1a) | 172.31.32.0/20 |
| apse1-az1 (ap-southeast-1b) |172.31.16.0/20 |
| apse1-az3 (ap-southeast-1c) | 172.31.0.0/20 |

Screenshot 1. Save it as `screenshot-1-subnets.png` in your folder. The image line below shows it.

![Screenshot 1: subnet list](screenshot-1-subnets.png)

### A3. Available addresses

Available IPv4 addresses in each subnet:

4090
4091
4091

Why is the number lower than 4,096?

AWS reserves 5 IP addresses in every subnet for internal networking purposes (network address, VPC router, DNS, future use, and broadcast).

What uses the missing address in the subnet with the lowest number?

An active AWS resource (such as an EC2 instance or an Elastic Network Interface) is currently deployed in that subnet, consuming one additional IP address.

### A4. The route table

| Destination | Target |
| --- | --- |
| 0.0.0.0/0 | 	
igw-0943e7e6f88293168 |
| 172.31.0.0/16 | local |

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

![Screenshot 2: routes of the route table](screenshot-2-routes.png)

### A5. Public or private

Are the default subnets public or private? Which route proves it?

They are public. The route 0.0.0.0/0 pointing to the internet gateway (igw-0943e7e6f88293168) proves it.

### A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

They become private subnets, and any resources inside them instantly lose direct inbound and outbound internet access.

### A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No. Private subnets do not have a route to the internet gateway, and without a NAT gateway, they cannot initiate outbound connections to the internet to download updates.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| * | 0.0.0.0/0 | Deny |

How is a network ACL different from a security group?

Network ACLs operate at the subnet level and are stateless (return traffic must be explicitly allowed), whereas security groups operate at the instance level and are stateful (return traffic is automatically allowed).

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

![Screenshot 3: inbound rules of the network ACL](screenshot-3-network-acl.png)

### A9. The default security group

Inbound rule (type and source):

All traffic - sg-0c5b6d4081cf0a534 / default

Which resources can send traffic to an instance that uses it?

Only other resources that are also associated with that exact same default security group.

---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.169.0.0/24
- Private subnet CIDR: 10.169.1.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.169.0.0/16 | local |
| 0.0.0.0/0 | internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.169.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

draw.io

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

![B3: my VPC diagram](vpc-diagram.png)

### B4. Predict a change

Can you still open the web page from your laptop? Why?

No. Deleting the 0.0.0.0/0 route removes the path to the internet gateway, cutting off all traffic from the public internet.

Can the instance still reach another instance in the VPC? Why?

Yes. The local route cannot be deleted, ensuring instances within the VPC can always route traffic to each other.

### B5. Place a database

Which subnet gets the database? Why?

The private subnet. This isolates the database from the public internet, protecting sensitive data from direct external attacks.

### B6. My question about VPCs

What is your question, and what made you think of it?

Question: Do private subnets across different Availability Zones need their own separate NAT Gateways, or can they share one?
Reason: I thought of this because NAT Gateways cost money, and I am wondering how to design a highly available architecture without paying for multiple gateways.