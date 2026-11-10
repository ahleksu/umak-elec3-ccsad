\# Assignment 2 Submission

\#\# About me

\- GitHub username: madeliiine  
\- Section: IV-CCSAD  
\- IAM user name that I signed in with: ccsad-g01  
\- X: 196

\---

\#\# Part A. Explore

\#\#\# A1. The VPC

Default VPC IPv4 CIDR:

\`172.31.0.0/16\`

Number of addresses in that CIDR:

65,536

\#\#\# A2. The subnets

| Availability Zone | IPv4 CIDR |  
| \--- | \--- |  
| \`ap-southeast-1a\` | \`172.31.32.0/20\` |  
| \`ap-southeast-1b\` | \`172.31.16.0/20\` |  
| \`ap-southeast-1c\` | \`172.31.0.0/20\` |

\!\[Screenshot 1: subnet list\](screenshot-1-subnets.png)

\#\#\# A3. Available addresses

Available IPv4 addresses in each subnet:

\`ap-southeast-1a\` 4,090, \`ap-southeast-1b\` 4,091, \`ap-southeast-1c\` 4,091.

Why is the number lower than 4,096?

A /20 subnet has 4,096 total IP addresses, but AWS reserves 5 of them for networking purposes. Because of this, only 4,091 addresses are available when the subnet is empty, which is why ap-southeast-1b and ap-southeast-1c show 4,091.

What uses the missing address in the subnet with the lowest number?

ap-southeast-1a has 4,090 available addresses, which is one less than the other subnets. This means one IP address is already being used, probably by a network interface for an instance. I can't tell exactly which resource is using it from this page.

\#\#\# A4. The route table

| Destination | Target |  
| \--- | \--- |  
| \`172.31.0.0/16\` | \`local\` |  
| \`0.0.0.0/0\` | \`igw-...\` |

\!\[Screenshot 2: routes of the route table\](screenshot-2-routes.png)

\#\#\# A5. Public or private

Are the default subnets public or private? Which route proves it?

The subnets are public because the 0.0.0.0/0 route points to the internet gateway. This gives the subnets a path to access the internet.

\#\#\# A6. The internet gateway

State of the internet gateway:

Attached

What happens to the default subnets if the gateway is detached?

If the internet gateway is detached, the subnets will no longer have a working connection to the internet. Instances won't be able to send traffic to or receive traffic from the internet, but they can still communicate with other instances inside the VPC because the local route is still there.

\#\#\# A7. NAT gateways

Number of NAT gateways:

0

Can a server in a new private subnet download updates? Why?

No, not at the moment. Since there are no NAT gateways, the private subnet has no way to send internet traffic out while staying private. A NAT gateway would need to be set up in a public subnet, and the private subnet would need a route pointing to it.

\#\#\# A8. The network ACL

| Rule number | Source | Allow or Deny |  
| \--- | \--- | \--- |  
| 100 | \`0.0.0.0/0\` | Allow |  
| \`\*\` | \`0.0.0.0/0\` | Deny |

How is a network ACL different from a security group?

A network ACL controls traffic for an entire subnet, while a security group controls traffic for a specific resource, such as an instance. Network ACLs have both allow and deny rules and are stateless, while security groups only have allow rules and are stateful. In this VPC, rule 100 allows all traffic, so nothing is currently being blocked.

\!\[Screenshot 3: inbound rules of the network ACL\](screenshot-3-network-acl.png)

\#\#\# A9. The default security group

Inbound rule (type and source):

All traffic, from \`sg-0c5b6d4081cf0a534\` (the \`default\` security group itself).

Which resources can send traffic to an instance that uses it?

Only resources that are also using the default security group can send traffic to the instance. Since the inbound rule only allows traffic from that security group, anything coming from a different source will be blocked.

\---

\#\# Part B. Prepare

\#\#\# B1. Plan two subnets

\- Public subnet CIDR: \`10.196.0.0/24\`  
\- Private subnet CIDR: \`10.196.1.0/24\`

\#\#\# B2. Route tables

Route table of the public subnet:

| Destination | Target |  
| \--- | \--- |  
| \`10.196.0.0/16\` | \`local\` |  
| \`0.0.0.0/0\` | internet gateway |

Route table of the private subnet:

| Destination | Target |  
| \--- | \--- |  
| \`10.196.0.0/16\` | \`local\` |

\#\#\# B3. My VPC diagram

Tool used (Excalidraw, draw.io, Lucidchart, or paper):

draw.io

\!\[B3: my VPC diagram\](vpc-diagram.png)

\#\#\# B4. Predict a change

Can you still open the web page from your laptop? Why?

No. My laptop accesses the instance through the internet, and the 0.0.0.0/0 route allows the traffic to go through the internet gateway. If this route is deleted, the instance no longer has a route to the internet. Having a public IP address alone isn't enough because the subnet still needs a route to the internet gateway.

Can the instance still reach another instance in the VPC? Why?

Yes. The local route (172.31.0.0/16 \-\> local) is separate from the internet route, so deleting 0.0.0.0/0 does not affect it. The local route still allows instances inside the VPC to communicate with each other.

\#\#\# B5. Place a database

Which subnet gets the database? Why?

The database should be placed in the private subnet (10.196.1.0/24). Since this subnet doesn't have a route to the internet gateway, the database can't be accessed directly from the internet. This makes it safer because only resources inside the VPC can connect to it.

\#\#\# B6. My question about VPCs

What is your question, and what made you think of it?

If all the groups are using the same default VPC, can one group's instance connect to another group's instance? If they can, what prevents them from accessing each other?

I thought of this because in A9, the Security groups page showed around 20 groups from different lab groups, and they were all using the same VPC (vpc-02b29ff02cd658307). This made me wonder if security groups are the main thing keeping each group's instances separate, especially since the default security group only allows traffic from instances that use the same security group.  
