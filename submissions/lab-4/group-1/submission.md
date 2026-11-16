# Lab 4 Submission

## About us

- Group number: 1
- Section: IV-CCSAD
- Group IAM user: ccsad-g01
- DynamoDB table name: umak-elec3-ccsad-g01-messages
- HTTP API name: umak-elec3-ccsad-g01-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3

GROUP_NAME = "Aurelius"
TABLE_NAME = "umak-elec3-ccsad-g01-messages"

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

![The Routes page with GET /messages and POST /messages](routes.png)

![Our curl POST commands and the answers](post.png)

![Our messages in the browser](get.png)

![The items in our DynamoDB table](items.png)

## Questions

1. Both routes call the same function. How does your code know which route a request came through?

   API Gateway puts the route that matched the request in the event as the field routeKey, for example "GET /messages" or "POST /messages". Our handler reads event.get("routeKey") and uses if statements to run the GET code (scan the table) or the POST code (store a new message). Any other value returns a 404.

2. What answer do you get when you open the invoke URL without `/messages`? Why does API Gateway answer this way, and not your function?

   We get {"message":"Not Found"}. Our API only has the routes GET /messages and POST /messages, so a request to the root path matches no route. API Gateway rejects it with a 404 before it calls the Lambda integration, so our function never runs.

3. Your `GET /messages` route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?

   The cost of each GET request grows. Scan reads every item in the table, and DynamoDB charges for the data it reads, so more items means more read units used per request. It also gets slower and returns a bigger response. A table with thousands of messages makes every GET read all of them, even if the visitor only needs a few.
