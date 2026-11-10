# Assignment 2 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-2/<your-github-username>/submission.md
2. Replace every answer placeholder with your own answer. Delete the angle brackets too.
3. Save your four images in the same folder, with the exact file names below.
4. Do not write your full name or your student number in this file.
-->

## About me

- GitHub username: NotLathrell
- Section: IV-CCSAD
- IAM user name that I signed in with: ccsad-g09
- X: 191

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
| apse1-az1 (ap-southeast-1b) | 172.31.16.0/20 |
| apse1-az3 (ap-southeast-1c) | 172.31.0.0/20 |

Screenshot 1. Save it as `screenshot-1-subnets.png` in your folder. The image line below shows it.

<img width="1741" height="493" alt="screenshot-1-subnets" src="https://github.com/user-attachments/assets/b52cd4f3-a13e-4958-bdec-02ad8567c381" />


### A3. Available addresses

Available IPv4 addresses in each subnet:

4,091

Why is the number lower than 4,096?

AWS reserves 5 addresses in every subnet: the first four and the last one.

What uses the missing address in the subnet with the lowest number?

Something in it holds an address through a network interface. That could be an instance from Lab 2, including a stopped one, since stopped instances keep their address.

### A4. The route table

| Destination | Target |
| --- | --- |
| 0.0.0.0/0 | igw-0943e7e6f88293168 |
| 172.31.0.0/16 | local |

Screenshot 2. Save it as `screenshot-2-routes.png` in your folder. The image line below shows it.

<img width="1693" height="153" alt="screenshot-2-routes" src="https://github.com/user-attachments/assets/53f305c7-afda-4fb8-9443-7603c6e29a1a" />


### A5. Public or private

Are the default subnets public or private? Which route proves it?

The subnets are public, and the proof is the 0.0.0.0/0 → igw-0943e7e6f88293168 route.

### A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

the 0.0.0.0/0 route would have nowhere to go, so the subnets would lose internet access in both directions. In effect they'd become private, while the local route between subnets would still work.

### A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No. A private subnet has no route to the internet gateway, and there's no NAT gateway to send its outbound traffic through.

### A8. The network ACL

| Rule number | Source | Allow or Deny |
| --- | --- | --- |
| 100 | 0.0.0.0/0 | Allow |
| * | 0.0.0.0/0 | Deny |

How is a network ACL different from a security group?

a NACL works at the subnet level, has allow and deny rules, is stateless, and checks rules in number order. A security group works at the resource level, has allow rules only, and is stateful

Screenshot 3. Save it as `screenshot-3-network-acl.png` in your folder. The image line below shows it.

<img width="1686" height="150" alt="screenshot-3-networl-acl" src="https://github.com/user-attachments/assets/0ca356bb-4d08-4b91-af94-7e82a744b8a9" />


### A9. The default security group

Inbound rule (type and source):

sgr-0b795189f3efb993c
Type: All traffic
Soruce: sg-0c5b6d4081cf0a534

Which resources can send traffic to an instance that uses it?

only resources that also use this same security group can send traffic in.

---

## Part B. Prepare

### B1. Plan two subnets

- Public subnet CIDR: 10.191.0.0/24
- Private subnet CIDR: 10.191.1.0/24

### B2. Route tables

Route table of the public subnet:

| Destination | Target |
| --- | --- |
| 10.191.0.0/16 | local |
| 0.0.0.0/0 | internet gateway |

Route table of the private subnet:

| Destination | Target |
| --- | --- |
| 10.191.0.0/16 | local |

### B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

Excalidraw

Save your diagram as `vpc-diagram.png` in your folder. The image line below shows it.

<img width="2048" height="1200" alt="vpc-diagram" src="https://github.com/user-attachments/assets/e9e142b0-af3e-486c-8995-3991937f00da" />


### B4. Predict a change

Can you still open the web page from your laptop? Why?

No. Even with a public IP and an open security group, there's no route between the subnet and the internet gateway anymore, so traffic can't get through.

Can the instance still reach another instance in the VPC? Why?

Yes. The local route is still there and connects all subnets in the VPC.

### B5. Place a database

Which subnet gets the database? Why?

It goes in the private subnet, because it has no internet gateway route, so the internet can't reach it directly. Only your app servers inside the VPC should talk to it.

### B6. My question about VPCs

What is your question, and what made you think of it?

What happens if two VPCs with overlapping CIDRs need to connect?
How do you choose a VPC size before you know how big the app will grow?
Can a subnet be resized after creation?
