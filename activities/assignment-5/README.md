# Assignment 5: Design and Price Your Lab 5 Architecture

This is a self-guided activity. In Lab 5, your group joins two things that it built: the [Seatwork 3](../seatwork-3/README.md) site on Amazon S3 and the [Lab 4](../lab-4/README.md) API. Before you build it, your group draws the Lab 5 architecture, prices one month of it in the AWS Pricing Calculator, and names the Well-Architected pillar that each improvement serves. The diagram is your build plan for Lab 5.

Work through this page first. It explains what Lab 5 builds and the numbers that you enter. Then follow the steps in [`assignment.md`](assignment.md).

## What you do

This is group work. You do not sign in to AWS. Your group submits one Pull Request.

1. Draw the Lab 5 architecture as `diagram.png`, with the official AWS Architecture Icons and the real name of each part.
2. Price one month of Lab 5 traffic in Asia Pacific (Singapore): Amazon S3, Amazon API Gateway, AWS Lambda, and Amazon DynamoDB.
3. Save the estimate and copy its share link.
4. Answer two questions: which cost grows the most when traffic grows ten times, and which pillar the throttle serves.

You create nothing in AWS, so this assignment costs nothing.

## Key ideas

### What Lab 5 builds

Lab 5 adds a guestbook to your Seatwork 3 page. A visitor opens your page from the S3 website endpoint over HTTP (Hypertext Transfer Protocol). The browser loads `index.html` from your bucket. Then the JavaScript in the page calls your Lab 4 HTTP API over HTTPS, the encrypted form of HTTP, with `fetch`:

- `GET /messages` shows the messages.
- `POST /messages` adds a message.

API Gateway sends each request to your Lambda function. The function reads or writes your DynamoDB table with the permissions of its execution role, and it writes its log to CloudWatch Logs.

Every part already exists except the guestbook code, the CORS rule, and the throttle. Your diagram uses these names. Replace `<group user>` with your group IAM user, for example `acsad-g03`.

| Part | Name |
| --- | --- |
| S3 bucket, from Seatwork 3 | `umak-elec3-<group user>-linktree` |
| Its website endpoint | `http://umak-elec3-<group user>-linktree.s3-website-ap-southeast-1.amazonaws.com` |
| HTTP API, from Lab 4 | `umak-elec3-<group user>-api` |
| Its stage | `$default` |
| Lambda function, from Seatwork 4 and Lab 4 | `umak-elec3-<group user>-api` |
| Its execution role | `umak-elec3-<group user>-lambda-role` |
| DynamoDB table, from Lab 4 | `umak-elec3-<group user>-messages` |
| Log group in CloudWatch Logs | `/aws/lambda/umak-elec3-<group user>-api` |

### CORS

An origin is the scheme, the host, and the port of a page, for example `http://umak-elec3-acsad-g03-linktree.s3-website-ap-southeast-1.amazonaws.com`. Your page and your API have different origins. A browser blocks a page from reading the answer of an API on another origin, unless the API allows that origin.

CORS (Cross-Origin Resource Sharing) is how the API allows it. The API tells the browser which origins, methods, and headers can call it. In Lab 5, your HTTP API allows one origin, your website endpoint, the methods `GET` and `POST`, and the header `content-type`.

Your page is on HTTP and your API is on HTTPS. A page on HTTP can call an API on HTTPS, so the browser does not block the call for that reason.

### Throttling

Throttling limits the requests that the API accepts. In Lab 5, your group sets two limits on the `$default` stage:

| Limit | Value | What it means |
| --- | --- | --- |
| Rate | 2 requests per second | The number of requests each second that the stage accepts over time |
| Burst | 5 requests | The most requests that the stage accepts at the same moment |

API Gateway answers a request over the limit with `429 Too Many Requests`. Your function does not run for that request.

### The traffic to price

These assumptions describe one month of your Lab 5 site:

| Assumption | Value | Why |
| --- | --- | --- |
| Page views a month | 100,000 | The traffic to price |
| S3 GET requests | 100,000 | Each view loads `index.html` once |
| `GET /messages` requests | 100,000 | Each view calls it once |
| `POST /messages` requests | 5,000 | One visitor in 20 posts a message |
| API requests and Lambda runs | 105,000 | 100,000 GET and 5,000 POST |
| DynamoDB reads | 0.1 million, eventually consistent | Each GET reads one item of 1 KB |
| DynamoDB writes | 0.005 million | Each POST writes one item of 1 KB |
| S3 storage | 1 GB | Your site needs far less. 1 GB is a round number |
| Lambda memory and duration | 128 MB and 100 ms | The same as Assignment 4 |

Your `GET /messages` route scans the whole table, so each GET reads more as the table grows. As in [Assignment 4](../assignment-4/README.md), this assignment assumes that each GET reads one item of 1 KB.

### Check every field

The calculator fills in its own defaults, and some of them are wrong for this assignment. In Assignment 4, the DynamoDB page started with provisioned capacity, not on-demand. Read every field before you trust a total. Choose **Lambda Function - Without Free Tier**, as in Assignment 4.

### What the estimate leaves out

- Data transfer from S3 and from API Gateway to the internet. Each page and each answer is small, so this cost is small at this traffic.
- CloudWatch Logs, which charges for the log data that your function writes. At this traffic, the logs are small.
- The extra requests of the guestbook. Before each POST, the browser sends one `OPTIONS` request, a preflight, to check the CORS rule. After each POST, the page loads the messages again. Together they add at most 10,000 requests a month.

## How you submit

Submit one Pull Request per group to this repository. Then one groupmate submits the Pull Request link in the Google Form: https://forms.gle/atFDyiKdxAePcGDH7. Both are due on Saturday, November 21, 2026, at 11:59 PM (Asia/Manila), the same time as Lab 5.

## Files in this folder

| File | What it is |
| --- | --- |
| [`README.md`](README.md) | This page: what Lab 5 builds, the ideas behind the diagram, and the numbers that you enter. |
| [`assignment.md`](assignment.md) | The four tasks, the calculator steps, what to submit, and the scoring. |
| [`submission-template.md`](submission-template.md) | Every item to submit, with an `<answer>` placeholder. Copy it to your submission folder as `submission.md`. |
