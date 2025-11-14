#!/bin/bash

# CloudFormation deployment script for Lambda function

STACK_NAME="lambda-stack"
TEMPLATE_FILE="cloudformation-template.yaml"
REGION="us-east-1"

echo "Deploying CloudFormation stack: $STACK_NAME"

aws cloudformation deploy \
  --template-file $TEMPLATE_FILE \
  --stack-name $STACK_NAME \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION \
  --parameter-overrides \
    FunctionName=MyLambdaFunction \
    Runtime=python3.11

echo "Deployment complete!"
echo "To get stack outputs, run:"
echo "aws cloudformation describe-stacks --stack-name $STACK_NAME --region $REGION --query 'Stacks[0].Outputs'"
