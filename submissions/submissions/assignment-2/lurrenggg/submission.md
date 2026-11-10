# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: lurrenggg
- Section: ccsad
- IAM user name that I signed in with: ccsad-g08
- X: 112

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

![Screenshot 1: subnet list](screenshot-1-subnets.png)

### A3. Available addresses

Available IPv4 addresses in each subnet:

- ap-southeast-1a: 4090
- ap-southeast-1b: 4091
- ap-southeast-1c: 4091

Why is the number lower than 4,096?

AWS reserves five IP addresses in every subnet, so not all 4,096 addresses are available for use.

What uses the missing address in the subnet with the lowest number?

One additional IP address is being used by a resource in the ap-southeast-1a subnet.

### A4. The route table

| Destination | Target |
| --- | --- |
| 0.0.0.0/0 | igw-0943e7e6f88293168 |
| 172.31.0.0/16 | local |

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

![Screenshot 2: routes of the route table](screenshot-2-routes.png)

### A5. Public or private

Are the default subnets public or private? Which route proves it?

The default subnets are public because the 0.0.0.0/0 route points to the internet gateway.

### A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

The default subnets would lose their path to the internet because their default route uses the internet gateway.

### A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No. A server in a new private subnet cannot download updates from the internet because there is no NAT gateway to provide outbound internet access.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| * | 0.0.0.0/0 | Deny |

How is a network ACL different from a security group?

A network ACL works at the subnet level and can have both allow and deny rules. A security group works at the resource level and uses allow rules only.

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

![Screenshot 3: inbound rules of the network ACL](screenshot-3-network-acl.png)

### A9. The default security group

Inbound rule (type and source):

Type: All traffic  
Source: sg-0c5b6d4081cf0a534 (the default security group itself)

Which resources can send traffic to an instance that uses it?

Resources that are also using the same default security group can send traffic to the instance.

---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.112.0.0/24
- Private subnet CIDR: 10.112.1.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.112.0.0/16 | local |
| 0.0.0.0/0 | internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.112.0.0/16 | local |
| 0.0.0.0/0 | NAT gateway |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

draw.io

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

![B3: my VPC diagram](vpc-diagram.png)

### B4. Predict a change

Can you still open the web page from your laptop? Why?

No. Without the 0.0.0.0/0 route to the internet gateway, the instance no longer has a path to the internet, so I cannot open its web page from my laptop.

Can the instance still reach another instance in the VPC? Why?

Yes. The instance can still reach another instance in the same VPC because the local route is still available.

### B5. Place a database

Which subnet gets the database? Why?

I would place the database in the private subnet because it should not be directly accessible from the internet. It can still communicate with other resources inside the VPC through the local route.

### B6. My question about VPCs

What is your question, and what made you think of it?

How can resources in two different VPCs communicate with each other? The activity explained how resources inside the same VPC communicate using the local route, which made me wonder how communication works between separate VPCs.