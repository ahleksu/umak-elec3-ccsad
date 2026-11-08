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

- Group number: Aquamarine
- Section: CCSAD
- Group IAM user: ccsad-g07
- DynamoDB table name: umak-elec3-ccsad-g07-messages
- HTTP API name: umak-elec3-ccsad-g07-api

## Handler code

```python
import json
import uuid
from datetime import datetime, timezone
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('umak-elec3-ccsad-g07-messages')

def lambda_handler(event, context):
    route_key = event.get('routeKey', '')
    
    if route_key == 'GET /messages':
        response = table.scan()
        items = response.get('Items', [])
        return {
            'statusCode': 200,
            'headers': {'Content-Type': 'application/json'},
            'body': json.dumps(items)
        }
        
    elif route_key == 'POST /messages':
        body = json.loads(event.get('body', '{}'))
        text = body.get('text') or body.get('message')
        
        if not text:
            return {
                'statusCode': 400,
                'headers': {'Content-Type': 'application/json'},
                'body': json.dumps({'error': 'Message text is required.'})
            }
            
        item = {
            'id': str(uuid.uuid4()),
            'author': body.get('author', 'Anonymous'),
            'text': text[:280],
            'createdAt': datetime.now(timezone.utc).isoformat()
        }
        
        table.put_item(Item=item)
        
        return {
            'statusCode': 200,
            'headers': {'Content-Type': 'application/json'},
            'body': json.dumps(item)
        }
        
    return {
        'statusCode': 404,
        'headers': {'Content-Type': 'application/json'},
        'body': json.dumps({'message': 'Not Found'})
    }