package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

// Define a custom event structure
type MyEvent struct {
	Name   string `json:"name"`
	Nation string `json:"nation"`
}

// Handler function
func handler(ctx context.Context, event MyEvent) (string, error) {
	return fmt.Sprintf("Hello, %s! You are from the nation of %s, you are not a citizen of Mandalore.", event.Name, event.Nation), nil
}

func main() {
	// Start the Lambda handler
	lambda.Start(handler)
}
