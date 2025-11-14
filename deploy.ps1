# PowerShell deployment script for Lambda CloudFormation stack

$StackName = "lambda-stack"
$TemplateFile = "cloudformation-template.yaml"
$Region = "us-east-1"

Write-Host "Deploying CloudFormation stack: $StackName" -ForegroundColor Green

aws cloudformation deploy `
  --template-file $TemplateFile `
  --stack-name $StackName `
  --capabilities CAPABILITY_NAMED_IAM `
  --region $Region `
  --parameter-overrides `
    FunctionName=MyLambdaFunction `
    Runtime=python3.11

if ($LASTEXITCODE -eq 0) {
    Write-Host "Deployment complete!" -ForegroundColor Green
    Write-Host "`nTo get stack outputs, run:" -ForegroundColor Yellow
    Write-Host "aws cloudformation describe-stacks --stack-name $StackName --region $Region --query 'Stacks[0].Outputs'" -ForegroundColor Cyan
} else {
    Write-Host "Deployment failed!" -ForegroundColor Red
}
