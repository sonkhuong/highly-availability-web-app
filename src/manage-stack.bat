@echo off
setlocal

set options=%1
set stack_name=%2
set template_file=%3
set parameter_file=%4

if /i "%options%"=="deploy" (
    aws cloudformation deploy --stack-name "%stack_name%" --template-file "%template_file%" --parameter-overrides file://"%parameter_file%" --capabilities "CAPABILITY_NAMED_IAM" --region=us-east-1
) else if /i "%options%"=="preview" (
    aws cloudformation deploy --stack-name "%stack_name%" --template-file "%template_file%" --parameter-overrides file://"%parameter_file%" --capabilities "CAPABILITY_NAMED_IAM" --no-execute-changeset --region=us-east-1
) else if /i "%options%"=="delete" (
    aws cloudformation delete-stack --stack-name "%stack_name%" --region=us-east-1
) else (
    echo ERROR: Incorrect execution mode. Valid values: deploy, delete, preview. >&2
    exit /b 1
)