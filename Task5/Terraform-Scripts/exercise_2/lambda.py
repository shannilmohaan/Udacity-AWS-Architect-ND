import json

def lambda_handler(event, context):
    print (" This is a message from lambda function provisioned using terraform")
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
