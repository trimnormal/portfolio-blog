import json
import boto3

def lambda_handler(event, context):
    """Lambda"""
    print(f"Received event: {json.dumps(event)}")  # Log the event for debugging

    # Check if "DomainToCheck" exists in the event dictionary
    if "DomainToCheck" in event:
        domain_to_check = event["DomainToCheck"]  # Extract the domain name

        # Initialize the Route 53 Domains client
        client = boto3.client('route53domains')

        # Check domain availability
        response = client.check_domain_availability(DomainName=domain_to_check)
        print(f"Domain availability response: {response}")  # Log the response for debugging

        # Return the response in the Lambda result
        return {
            'statusCode': 200,
            'body': json.dumps(response)
        }

    # Handle missing "DomainToCheck" key in the event
    return {
        'statusCode': 400,
        'body': json.dumps('DomainToCheck key is missing from the event.')
    }

if __name__ == "__main__":
    event = {"DomainToCheck": "zacharycorbishley.dev"}
    result = lambda_handler(event=event, context=None)
