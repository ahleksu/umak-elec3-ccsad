# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: kcalicaa12346055
- Section: IV - CCSAD
- IAM user name that I signed in with: Elias
- X: 155

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
| ap-southeast-1c | 172.31.0.0/20 |
| ap-southeast-1a | 172.31.32.0/20 |
| ap-southeast-1b | 172.31.16.0/20 |

Screenshot 1. Save it as `screenshot-1-subnets.png` in your folder. The image line below shows it.

![Screenshot 1: subnet list](./screenshot-1-subnets.png)

### A3. Available addresses

Available IPv4 addresses in each subnet:

4,091 for ap-southeast-1c
4,091 for ap-southeast-1b
4,090 for the subnet running the EC2 instance

Why is the number lower than 4,096?

AWS reserves 5 IP addresses in every subnet for networking purposes (the network address, VPC router, DNS server, future use, and network broadcast address), leaving a maximum of 4,091 usable addresses in a /20 subnet.

What uses the missing address in the subnet with the lowest number?

An active EC2 instance running in that subnet (its Elastic Network Interface / ENI uses one IP address)

### A4. The route table

| Destination | Target |
| --- | --- |
| 172.31.0.0/16 | local |
| 0.0.0.0/0 | igw-0e93eb9cb89e27b9d |

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

![Screenshot 2: routes of the route table](<img width="1725" height="505" alt="screenshot-2-routes" src="https://github.com/user-attachments/assets/e9b2648e-1854-4ff6-ad16-17dfefe9e965" />
)

### A5. Public or private

Are the default subnets public or private? Which route proves it?

The default subnets are public. The route with destination 0.0.0.0/0 targeting the Internet Gateway (igw-0e93eb9cb89e27b9d) in the route table proves it, as it allows traffic to flow to and from the internet.
### A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

The subnets effectively become private subnets. Instances inside them lose direct inbound and outbound internet connectivity, and the 0.0.0.0/0 route targeting the detached Internet Gateway will show a status of Blackhole (invalid route target)

### A7. NAT gateways

Number of NAT gateways:

0 (or None)

Can a server in a new private subnet download updates? Why?

No. A server in a private subnet has no route to an Internet Gateway, and because there is no NAT gateway in the VPC, outbound connections to the internet cannot be established to download updates.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| * | 0.0.0.0/0 | Deny |

How is a network ACL different from a security group?

Network ACLs support both Allow and Deny rules processed in numbered order, whereas Security Groups support Allow rules only.

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

![Screenshot 3: inbound rules of the network ACL](<img width="1728" height="533" alt="screenshot-3-network-acl" src="https://github.com/user-attachments/assets/b8aac12e-a8ee-44f6-b022-f039959bce92" />
)

### A9. The default security group

Inbound rule (type and source):

All traffic with the source set to the security group itself (sg-xxxxxxxx / self)

Which resources can send traffic to an instance that uses it?

Only other resources (EC2 instances, databases, interfaces) that are assigned to this same default security group. Outside traffic from the internet or other security groups is blocked by default.
---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.155.0.0/16
- Private subnet CIDR: 10.155.1.0/24
  
### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.155.0.0/16 | local |
| 0.0.0.0/0 | Internet Gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.155.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

Excalidraw.com

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

![B3: my VPC diagram](<img width="1021" height="598" alt="vpc-diagram" src="https://github.com/user-attachments/assets/5c9fb58d-f11f-40fc-ad0b-2191a04dc1e1" />
)

### B4. Predict a change

Can you still open the web page from your laptop? Why?

No. Without the 0.0.0.0/0 route targeting the Internet Gateway in the subnet's route table, traffic cannot travel between your laptop on the internet and the EC2 instance.

Can the instance still reach another instance in the VPC? Why?

Yes. The local route (10.155.0.0/16 $\rightarrow$ local) remains active in the route table, allowing all instances within the same VPC to communicate with each other regardless of internet connectivity.

### B5. Place a database

Which subnet gets the database? Why?

The private subnet (10.155.2.0/24). A database holds sensitive data and should not be directly accessible from the internet. Placing it in a private subnet keeps it secure while still allowing web servers in the public subnet to reach it via the VPC's local route.

### B6. My question about VPCs

What is your question, and what made you think of it?

if two private subnets in different VPCs need to talk to each other without exposing traffic to the public internet, how do they connect?

Since, learning that private subnets have no route to the internet gateway made me wonder how companies connect separate internal systems across different environments or accounts safely.
