# Lambda Function CloudFormation Deployment

This repository contains CloudFormation templates to deploy AWS Lambda functions.

## Files

- `cloudformation-template.yaml` - CloudFormation template for Lambda deployment
- `deploy.sh` - Bash script for deploying the stack
- `deploy.ps1` - PowerShell script for deploying the stack (Windows)

## Prerequisites

- AWS CLI installed and configured
- AWS credentials with permissions to create Lambda functions, IAM roles, and CloudFormation stacks

## Deployment

### Using AWS CLI (Windows CMD)

```cmd
aws cloudformation deploy --template-file cloudformation-template.yaml --stack-name lambda-stack --capabilities CAPABILITY_NAMED_IAM --region us-east-1 --parameter-overrides FunctionName=MyLambdaFunction Runtime=python3.11
```

### Using PowerShell Script

```powershell
.\deploy.ps1
```

### Using Bash Script (Git Bash/WSL)

```bash
bash deploy.sh
```

## Parameters

- `FunctionName` - Name of your Lambda function (default: MyLambdaFunction)
- `Runtime` - Lambda runtime (default: python3.11)

## What Gets Created

1. **Lambda Function** - The main Lambda function with inline code
2. **IAM Execution Role** - Role with basic Lambda execution permissions
3. **CloudWatch Log Group** - Log group for Lambda function logs (7-day retention)

## Customization

To use your own Lambda code:

1. Package your code as a ZIP file
2. Upload to S3
3. Update the `Code` section in the template:

```yaml
Code:
  S3Bucket: your-bucket-name
  S3Key: your-code.zip
```

## Cleanup

To delete the stack:

```cmd
aws cloudformation delete-stack --stack-name lambda-stack --region us-east-1
```
