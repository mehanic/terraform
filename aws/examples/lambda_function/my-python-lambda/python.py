import json

def handler(event, context):
    """
    Example AWS Lambda function.
    """
    # Log the input event
    print("Received event:", json.dumps(event, indent=2))
    
    # Extract parameters from the input event
    name = event.get("name", "Guest")
    age = event.get("age", "unknown")
    
    # Create a response
    response = {
        "message": f"Hello, {name}! Your age is {age}.",
        "status": "success"
    }
    
    # Return the response
    return {
        "statusCode": 200,
        "body": json.dumps(response)
    }
