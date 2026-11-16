---
week: 16
graded: true
counts_toward: Final Class Standing, Seatwork/Assignment/Recitation (10%)
duration: 60 to 90 minutes
mode: Group. No AWS sign-in. One Pull Request per group in this repository, then the Pull Request link in the Google Form.
coverage: Architecture diagrams with the AWS Architecture Icons, Amazon S3 website endpoints, CORS, throttling on an API Gateway stage, cost estimates in the AWS Pricing Calculator for Amazon S3, Amazon API Gateway, AWS Lambda, and Amazon DynamoDB, cost growth with traffic, the Well-Architected pillars
due: 2026-11-19, 11:59 PM (Asia/Manila), the same time as Lab 5
---

# Assignment 5: Design and Price Your Lab 5 Architecture

> Submit one Pull Request per group to this repository. Then one groupmate submits the Pull Request link in the Google Form: https://forms.gle/atFDyiKdxAePcGDH7. Both are due on Thursday, November 19, 2026, at 11:59 PM (Asia/Manila), the same time as Lab 5. Do not merge your own Pull Request.

This is a self-guided activity. Your group draws the architecture that it builds in Lab 5, prices one month of it in the AWS Pricing Calculator, and answers two questions about cost and design. You create nothing in AWS, so this activity costs nothing. Read [`README.md`](README.md) before you start. It explains what Lab 5 builds, the names of your parts, and the numbers that you enter.

## Task 1. Draw the architecture (3 points)

Draw the Lab 5 architecture with any tool, for example draw.io, Excalidraw, or Canva. Use the official AWS Architecture Icons: <https://aws.amazon.com/architecture/icons/>. In draw.io, choose **More Shapes** and turn on an AWS shape library. For Excalidraw or Canva, download the icon package from the AWS page and add the icons as images.

Your diagram must show these parts. Label each part with its real name from the names table in [`README.md`](README.md), with your group IAM user in place of `<group user>`.

- The browser of a visitor.
- The S3 bucket and its website endpoint, labeled HTTP.
- The HTTP API, labeled HTTPS, with its two routes `GET /messages` and `POST /messages`.
- The CORS rule of the HTTP API: the allowed origin, the methods `GET` and `POST`, and the header `content-type`.
- The throttle on the `$default` stage: rate 2 requests per second, burst 5.
- The Lambda function and its execution role.
- The DynamoDB table.
- CloudWatch Logs, with the log group of the function.

Draw an arrow for each request: from the browser to the S3 website endpoint, from the browser to the HTTP API, from the HTTP API to the function, from the function to the table, and from the function to CloudWatch Logs.

Do not write your invoke URL, your API ID, an ARN (Amazon Resource Name), or the account number in the diagram, because anyone can read this repository. Export the diagram as `diagram.png`.

## Task 2. Price one month (3 points, and 1 point for the share link)

Open the AWS Pricing Calculator at <https://calculator.aws>. You do not sign in. Choose **Create estimate**. For each service below, search for the service and choose **Configure**. Set the Region to **Asia Pacific (Singapore)** first. Then fill in the fields. After each service, choose **Save and add service**. After the last one, choose **Save and view summary**.

### Amazon S3

In the list of storage classes and features, **S3 Standard** and **Data Transfer** are chosen when the page opens. Keep both, and leave the **Data Transfer** fields empty. Under **How will data be moved into S3 Standard?**, keep **The specified amount of data is already stored in S3 Standard**.

| Field | Value |
| --- | --- |
| S3 Standard storage | `1` GB per month |
| PUT, COPY, POST, LIST requests to S3 Standard | `0` |
| GET, SELECT, and all other requests from S3 Standard | `100000` |
| Data returned by S3 Select | `0` GB |
| Data scanned by S3 Select | `0` GB |

Your group uploads `index.html` only a few times, so the PUT requests are too few to change the price. Type `0`.

### Amazon API Gateway

Fill in the **HTTP APIs** section only. Leave **REST APIs** and **WebSocket APIs** empty.

| Field | Value |
| --- | --- |
| HTTP API requests units | millions |
| Requests | `0.105` per month |
| Average size of each request | `1` KB |

The unit is millions, so type `0.105`, not `105000`. Replace any number that is already in **Average size of each request**.

### AWS Lambda

Choose **Lambda Function - Without Free Tier**. Fill in **Service settings** only. Leave **Provisioned Concurrency**, **SnapStart**, and **Lambda@Edge** empty, and keep **Lambda HTTP Response Streaming** at **Buffered**.

| Field | Value |
| --- | --- |
| Architecture | x86 |
| Number of requests | `105000` per month |
| Duration of each request (in ms) | `100` |
| Amount of memory allocated | `128` MB |
| Amount of ephemeral storage allocated | `512` MB, the default |

### Amazon DynamoDB

Under **Choose DynamoDB features**, turn on **DynamoDB on-demand capacity** and turn off **DynamoDB provisioned capacity**. Then check that **Total Upfront cost** at the bottom of the page is 0.00 USD.

| Field | Value |
| --- | --- |
| Table class | Standard |
| Data storage size | `1` GB |
| Average item size (all attributes) | `1` KB |
| Standard writes | `100` % |
| Transactional writes | `0` % |
| Number of writes | `0.005` million per month, the POST requests |
| Eventually consistent percentage | `100` % |
| Strongly consistent percentage | `0` % |
| Transactional percentage | `0` % |
| Number of reads | `0.1` million per month, the GET requests |

### Save and share

On the summary page, check that the estimate lists four services, all in Asia Pacific (Singapore). Note the monthly cost of each service and the total. Then use **Share** to get a public link to the estimate.

## Task 3. Ten times the traffic (2 points)

Your site gets famous. Each month now has 1,000,000 page views and 50,000 posts, ten times the traffic in Task 2. Which service's monthly cost grows the most in US dollars, and why? Use the numbers in your estimate. You can work it out from your estimate, so you do not need a second share link.

## Task 4. The throttle and one more improvement (1 point)

In Lab 5, your group sets a throttle on the `$default` stage: rate 2 requests per second, burst 5. Which Well-Architected pillar does the throttle serve, and why? Then name one more improvement for the same architecture, and the pillar that it serves. The six pillars are on the AWS page [The pillars of the framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/the-pillars-of-the-framework.html).

## What to submit

1. Create the folder `submissions/assignment-5/group-<number>/` on a branch named `assignment-5-group-<number>`.
2. Save `diagram.png` in that folder.
3. Copy [`submission-template.md`](submission-template.md) to that folder as `submission.md`. Fill in every item:
   - Your group number, section, and group IAM user.
   - The monthly cost in USD of S3, API Gateway, Lambda, and DynamoDB, and their total.
   - The share link of your estimate.
   - Your answers to Task 3 and Task 4.
   - One line per groupmate: GitHub username and what each one did.
4. Check that nothing in the folder shows your invoke URL, your API ID, an ARN, or the account number.
5. Open one Pull Request. One groupmate submits its link in the Google Form for the whole group: https://forms.gle/atFDyiKdxAePcGDH7.

| Check | Points |
| --- | --- |
| The diagram shows every part in Task 1, with the AWS icons, the real names, and an arrow for each request | 3 |
| The estimate: S3, API Gateway, Lambda, and DynamoDB with the given settings, and their monthly costs and total | 3 |
| A share link that opens your estimate with all four services | 1 |
| A correct answer about ten times the traffic, with a reason | 2 |
| The pillar of the throttle with a reason, and one more improvement with its pillar | 1 |
| **Total** | **10** |

## If you get stuck

- The API Gateway cost is far too high: the unit is millions. Type `0.105`.
- The DynamoDB estimate has an upfront cost: provisioned capacity is still on. Turn it off.
- An S3 field in the table is not on your screen: use the field that means the same thing. If you are not sure, message me in the group chat.
- The total does not change: click outside the field that you typed in, so the calculator updates.
- You cannot find an icon in the AWS package: search for the full service name, for example `Simple-Storage-Service` for Amazon S3.
- Your diagram shows the invoke URL or an ARN: remove it, then export `diagram.png` again.
- Check your share link before you submit: open it in a private browser window and confirm that all four services show.
- Anything else: message me in the group chat.

AWS documentation, if you want more detail: [AWS Architecture Icons](https://aws.amazon.com/architecture/icons/), [What is AWS Pricing Calculator?](https://docs.aws.amazon.com/pricing-calculator/latest/userguide/what-is-pricing-calculator.html), [Amazon S3 pricing](https://aws.amazon.com/s3/pricing/), [Configuring CORS for HTTP APIs](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html), and [Throttle requests to your HTTP APIs](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-throttling.html).
