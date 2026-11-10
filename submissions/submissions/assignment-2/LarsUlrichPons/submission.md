# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: LarsUlrichPons
- Section: IV-CCSAD
- IAM user name that I signed in with: ccsad-g07
- X: 186

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
| apse1-az1 (ap-southeast-1b) | 172.31.16.0/20|
| apse1-az3 (ap-southeast-1c)|172.31.0.0/20 |

Screenshot 1. Save it as `screenshot-1-subnets.png` in your folder. The image line below shows it.

![Screenshot 1: subnet list](screenshot-1-subnets.png)

### A3. Available addresses

Available IPv4 addresses in each subnet:

4090
4091 
4091 

Why is the number lower than 4,096?

AWS always reserves 5 IP addresses in every subnet for its own internal networking and routing.

What uses the missing address in the subnet with the lowest number?

The missing address is being used by the virtual network interface of your EC2 instance from Lab 2.

### A4. The route table

| Destination | Target |
| --- | --- |
| 0.0.0.0/0 |igw-0943e7e6f88293168 |
| 172.31.0.0/16 | local|

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

![Screenshot 2: routes of the route table](screenshot-2-routes.png)

### A5. Public or private

Are the default subnets public or private? Which route proves it?

The default subnets are public. The route that proves this is destination 0.0.0.0/0 pointing to target igw-... (internet gateway).

### A6. The internet gateway

State of the internet gateway:

attached

What happens to the default subnets if the gateway is detached?

If this gateway is detached from the VPC, the default subnets lose their connection to the outside world, meaning any instances inside them will no longer be able to send or receive internet traffic.

### A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No. A server in a private subnet needs a NAT gateway to initiate outbound connections to the internet, and this VPC currently has no NAT gateways.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| * | 0.0.0.0/0 | Deny|

How is a network ACL different from a security group?

A Network ACL acts as a stateless firewall at the subnet level and processes both "allow" and "deny" rules in numerical order. In contrast, a security group acts as a stateful firewall at the individual instance level and only supports "allow" rules.

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

![Screenshot 3: inbound rules of the network ACL](screenshot-3-network-acl.png)

### A9. The default security group

Inbound rule (type and source):

All Traffic - sg-0c5b6d4081cf0a534 / default

Which resources can send traffic to an instance that uses it?

Only resources (such as other instances) that are also assigned to this exact same default security group can send traffic to an instance that uses it.
---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.186.0.0/24
- Private subnet CIDR: 10.186.1.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.186.0.0/16| local |
| 0.0.0.0/0 | internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.186.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

draw.io

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

![B3: my VPC diagram](vpc-diagram.png)

### B4. Predict a change

Can you still open the web page from your laptop? Why?

No, because deleting the 0.0.0.0/0 route to the internet gateway removes the path that allows the instance to send reply traffic back to the internet.

Can the instance still reach another instance in the VPC? Why?

Yes, because traffic between instances within the same VPC uses the default local route, which remains active even if the internet gateway route is deleted.

### B5. Place a database

Which subnet gets the database? Why?

The private subnet (10.186.1.0/24). A database holds sensitive data and should not be directly accessible from the internet; placing it in a private subnet ensures it can only be reached by authorized resources inside the VPC.

### B6. My question about VPCs

What is your question, and what made you think of it?

How do developers or administrators securely connect to and manage a database if it is placed in a private subnet with no internet access? I thought of this because securing the database is important, but it seems like it would also block the database administrator from doing their job from their own laptop.
