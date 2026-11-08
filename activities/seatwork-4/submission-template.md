<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/190e9042-3149-444c-b9a0-74e3d1711653" /># Seatwork 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/seatwork-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save code.png, test.png, and report.png in the same folder.
4. Crop the AWS console top bar out of all three screenshots, and cover every ARN.
5. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: Group - 2  
- Section: IV - CCSAD
- Group IAM user: ccsad-g02
- Function name: umak-elec3-ccsad-g02-api

## Handler code

```python
import json

GROUP_NAME = "Group 2 of IV-CCSAD" 


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
REPORT RequestId: ce8c1de4-734c-477b-8137-9a4e510348ea Duration: 2.51 ms Billed Duration: 89 ms Memory Size: 128 MB Max Memory Used: 31 MB Init Duration: 85.91 ms
```

Second run, a warm start:

```text
REPORT RequestId: 3a59da5a-40e0-4607-b07b-1914f1d934d5 Duration: 1.56 ms Billed Duration: 2 ms Memory Size: 128 MB Max Memory Used: 31 MB
```

## Question

Why does the second REPORT line have no Init Duration?

The second run was a warm start, meaning AWS Lambda reused the execution environment that was already provisioned during the first run. Because the environment and runtime were already set up, it did not need to spend time initializing them again. Therefore, the "Init Duration" measurement is completely bypassed and does not show up in the logs.

## Screenshots

<img width="1138" height="597" alt="code" src="https://github.com/user-attachments/assets/e97fc792-f3c2-486b-a555-eac44c26f8b0" />

<img width="833" height="363" alt="test" src="https://github.com/user-attachments/assets/cfa3e4da-0513-403c-b7df-7b407dd9dacf" />

<img width="902" height="136" alt="report" src="https://github.com/user-attachments/assets/db887a81-4f39-4e6c-a75e-ba7382fb1325" />


## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| RalphEspartero3  | Created the Lambda function in the AWS console and configured the custom execution role |
| saromoAndreiLuis | Wrote the Python handler code, updated the group name variable, and deployed the function |
| rssnjade | Created the JSON test event, executed the cold and warm starts, and gathered screenshots |
| DietherUrdas | Navigated CloudWatch to locate the log stream and extracted the exact REPORT lines |
