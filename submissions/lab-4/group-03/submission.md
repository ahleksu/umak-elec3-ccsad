# Lab 4 Submission

## About us

- Group number: 03
- Section: IV-CCSAD
- Group IAM user: ccsad-g03
- DynamoDB table name: umak-elec3-ccsad-g03-messages
- HTTP API name: umak-elec3-ccsad-g03-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3

GROUP_NAME = "Group 3 of IV-CCSAD"  # Keep your group's name from Seatwork 4.
TABLE_NAME = "umak-elec3-ccsad-g03-messages"  # Change acsad-g03 to your group IAM user.

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

   API Gateway puts the route that matched into the event as `routeKey`, for example `"GET /messages"` or `"POST /messages"`. Our handler reads `event.get("routeKey")` and compares it with each route. `GET /messages` scans the table, `POST /messages` stores a new message, and any other value returns 404.

2. What answer do you get when you open the invoke URL without `/messages`? Why does API Gateway answer this way, and not your function?

   We get status 404 with `{"message":"Not Found"}`. Our API has only two routes, `GET /messages` and `POST /messages`, and no route for `GET /`. API Gateway matches each request to a route before it calls an integration. When no route matches, API Gateway answers with 404 by itself and never calls our Lambda function.

3. Your `GET /messages` route uses Scan. What happens to the cost of each GET request as the table grows to thousands of messages? Why?

   The cost of each GET request grows with the size of the table. Scan reads every item in the table, and on-demand DynamoDB charges for the data that each request reads. With thousands of messages, every GET reads all of them, so it uses more read capacity and takes longer, even if the page only needs a few messages. One Scan call also returns at most 1 MB, so a larger table needs more calls.
