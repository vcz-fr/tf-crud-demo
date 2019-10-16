{
    "responses": {
        "204": {
            "headers": {
                "Access-Control-Allow-Origin": {
                    "type": "string"
                },
                "Access-Control-Allow-Methods": {
                    "type": "string"
                },
                "Access-Control-Allow-Headers": {
                    "type": "string"
                }
            }
        }
    },
    "x-amazon-apigateway-integration": {
        "responses": {
            "default": {
                "statusCode": "204",
                "responseParameters": {
                    "method.response.header.Access-Control-Allow-Methods": "'POST,PUT,DELETE,GET,OPTIONS'",
                    "method.response.header.Access-Control-Allow-Headers": "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
                    "method.response.header.Access-Control-Allow-Origin": "'*'"
                }
            }
        },
        "requestTemplates": {
            "application/json": "{\"statusCode\": 204}"
        },
        "passthroughBehavior": "when_no_match",
        "type": "mock"
    }
}
