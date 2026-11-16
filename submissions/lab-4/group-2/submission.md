# Lab 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save routes.png, post.png, get.png, and items.png in the same folder.
4. Crop the AWS console top bar out of routes.png and items.png, and cover every ARN.
5. Cover your API ID, the part between https:// and .execute-api, in routes.png, post.png, and get.png. Your invoke URL goes only in the Google Form, never in this repository.
6. Do not write full names or student numbers in this file.
-->

## About us

- Group number: Group - 2
- Section: IV - CCSAD   
- Group IAM user: ccsad-g02
- DynamoDB table name: umak-elec3-ccsad-g02-messages
- HTTP API name: umak-elec3-ccsad-g02-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3

GROUP_NAME = "Group 2 of IV-CCSAD"
TABLE_NAME = "umak-elec3-ccsad-g02-messages"

table = boto3.resource("dynamodb").Table(TABLE_NAME)


def respond(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }


def read_json_body(event):
    body = event.get("body") or "{}"
    if event.get("isBase64Encoded"):
        body = base64.b64decode(body).decode("utf-8")
    return json.loads(body)


def lambda_handler(event, context):
    route = event.get("routeKey")

    if route == "GET /messages":
        items = table.scan()["Items"]
        return respond(200, items)

    if route == "POST /messages":
        try:
            data = read_json_body(event)
        except ValueError:
            data = None
        if not isinstance(data, dict) or not data.get("text"):
            return respond(400, {"error": "Send a JSON body with a text field."})
        if len(str(data["text"])) > 280:
            return respond(400, {"error": "Keep the text at 280 characters or fewer."})
        message = {
            "id": str(uuid.uuid4()),
            "author": str(data.get("author") or GROUP_NAME)[:80],
            "text": str(data["text"]),
            "createdAt": datetime.now(timezone.utc).isoformat(),
        }
        table.put_item(Item=message)
        return respond(201, message)

    return respond(404, {"error": f"No route for {route}"})
```

## Screenshots

<img width="369" height="337" alt="routes" src="https://github.com/user-attachments/assets/1b9a5b80-e0da-4e83-a341-fe8b15e2033a" />


<img width="527" height="524" alt="post" src="https://github.com/user-attachments/assets/23bc4653-b7f8-4841-862d-6fb878a1741c" />


<img width="1357" height="142" alt="get" src="https://github.com/user-attachments/assets/9aa0eaac-525c-4760-aa4c-dbe0125df318" />


<img width="864" height="226" alt="items" src="https://github.com/user-attachments/assets/c8426eab-0d51-49c4-a787-6ca7b9266381" />


## Questions

1. Both routes call the same function. How does your code know which route a request came through?

   The code inspects the event dictionary sent by API Gateway and reads the routeKey value (using event.get("routeKey")). This tells the function whether the request was "GET /messages" or "POST /messages" so it can run the correct logic block.

2. What answer do you get when you open the invoke URL without `/messages`? Why does API Gateway answer this way, and not your function?

   You get {"message":"Not Found"}. API Gateway returns this automatically because you only created routes for /messages. Since there is no route configured for the base URL (/), API Gateway rejects the request immediately without ever invoking your Lambda function.

3. Your `GET /messages` route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?

   The cost of each GET request will steadily increase. A Scan operation reads every single item in the entire table before filtering or returning anything. As the table grows to thousands of messages, each scan consumes more Read Capacity Units (RCUs), which directly increases the cost of the query.
