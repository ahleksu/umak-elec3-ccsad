# Lab 4 Submission

## About us

- Group number: 8
- Section: IV-CCSAD
- Group IAM user: ccsad-g08
- DynamoDB table name: umak-elec3-ccsad-g08-messages
- HTTP API name: umak-elec3-ccsad-g08-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3

GROUP_NAME = "Group 8 of IV-CCSAD"
TABLE_NAME = "umak-elec3-ccsad-g08-messages"

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

   API Gateway puts the matched route in the event it sends to Lambda, in the `routeKey` field (for example `"GET /messages"` or `"POST /messages"`) because we use payload format 2.0. Our handler reads `event.get("routeKey")` and uses `if` checks to run the GET code (scan the table) or the POST code (validate and save a message). Any other value falls through to the 404 response at the end.

2. What answer do you get when you open the invoke URL without `/messages`? Why does API Gateway answer this way, and not your function?

   We get `{"message":"Not Found"}` with HTTP status 404. API Gateway answers this itself because it only forwards requests that match a route, and we created only `GET /messages` and `POST /messages`. The bare URL (`GET /`) matches neither, and there is no `$default` route, so the request is rejected at the gateway and never reaches our Lambda function. This is different from our function's own 404 (`No route for ...`), which only runs for requests the gateway has already forwarded.

3. Your `GET /messages` route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?

   The cost grows with the table. Scan reads every item in the table (it is billed for the amount of data read, in read capacity units, and returns at most 1 MB per call, so large tables need several calls). With thousands of messages, each GET reads and returns all of them, so every request gets slower, uses more read capacity, costs more in on-demand billing, and sends a bigger response. It does this even when the user only wants a few recent messages. Query on a key, or paginating and limiting results, avoids reading the whole table.
