## Overview

This is a **complete AWS CloudFormation template** for running the MyBB application on a scalable, highly-available and secure infrastructure.

### Running the stack

To run this project in an AWS Account do the following:

- Login to the AWS consule and browse to the CloudFormation section
- Create an EC2 KeyPair (required for SSH access, can't be automated by CF)
- Click on "Create stack" and select "Upload a template to Amazon S3"
- Select the "aws_cloudformation_stack.json" located in "Code\aws_config"
- Before clicking "Create", make sure that you scroll down and tick the "I acknowledge that AWS CloudFormation might create IAM resources" checkbox
- Launch a stack from this template with CloudFormation
- ...drink coffee...
- Go to the URL in the output variable for the live MyBB application.

## Evaluation Access Account

- MyBB application Administrator Account:
    - Username: admin
    - Password: 1234

## Resources created
- 2 EC2 instances
- 1 Load Balancer
- 1 MySQL RDS MultiAZ
- S3 bucket that connects to the "uploads" folder to share the data between instances
- 1 IAM user with programatic access to mount the S3 bucket
- SNS for alerting


## CREDITS
This project was built on top of  **vpalos**'s stack, which is available here -> https://github.com/vpalos/cloudformation-mybb
