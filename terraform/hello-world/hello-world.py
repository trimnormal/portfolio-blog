import json

def lambda_handler(event, context):
    # Log event data (optional, for debugging purposes)
    print(f"Received event: {json.dumps(event)}")

    # Return a simple response
    return {
        'statusCode': 200,
        'body': json.dumps('Hello, World!')
    }