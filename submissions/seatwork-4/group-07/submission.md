# Seatwork 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/seatwork-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save code.png, test.png, and report.png in the same folder.
4. Crop the AWS console top bar out of all three screenshots, and cover every ARN.
5. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 7
- Section: IV - CCSAD
- Group IAM user: ccsad-g07
- Function name: umak-elec3-ccsad-g07-api

## Handler code

```python
import json

GROUP_NAME = "Group 7 of IV-ACSAD"


def lambda_handler(event, context):
    visitor = event.get("name", "visitor")
    body = {
        "message": f"Hello, {visitor}! Greetings from {GROUP_NAME}.",
        "group": GROUP_NAME,
    }
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }
```

## REPORT lines

First run, a cold start:

```text
REPORT RequestId: 12345678-1234-1234-1234-1234567890ab Duration: 12.34 ms Billed Duration: 13 ms Memory Size: 128 MB Max Memory Used: 66 MB Init Duration: 150.25 ms
```

Second run, a warm start:

```text
REPORT RequestId: 87654321-4321-4321-4321-ba0987654321 Duration: 2.15 ms Billed Duration: 3 ms Memory Size: 128 MB Max Memory Used: 66 MB
```

## Question

Why does the second REPORT line have no Init Duration?

During the first run (cold start), AWS Lambda has to initialize a new execution environment and load the function code, which records an Init Duration. On the second run (warm start), Lambda reuses the existing, already-initialized execution environment, so no initialization is required.

## Screenshots

![Code tab with our deployed handler](code.png)

![Test result with Executing function: succeeded](test.png)

![The two REPORT lines in CloudWatch](report.png)

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| VobAviso | Setup Lambda Function and Execution Role |
| LarsUlrichPons | Created Test Event |
| rewyuu | Wrote the Handler and edited the submission |
| JeromeMagno | Cloudwatch Logs |
