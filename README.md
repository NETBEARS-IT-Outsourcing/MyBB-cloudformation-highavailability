## Overview

This is a **complete AWS CloudFormation template** for running the MyBB application on a scalable, highly-available and secure infrastructure.

### Running the stack

To run this project in an AWS Account do the following:

- Login to the AWS consule and browse to the ECS section
- Create a cluster with a small instance in it
- Create an EC2 KeyPair (required for SSH access, can't be automated by CF)
- Go to the CloudFormation section, select the CF stack that was created by ECS, click on "Update stack" and select "Upload a template to Amazon S3"
- Select the "aws_ecs.yaml" file located in "aws_config"
- Before clicking "Update", make sure that you scroll down and tick the "I acknowledge that AWS CloudFormation might create IAM resources" checkbox
- Launch a stack from this template with CloudFormation
- ...drink coffee...
- Go to the URL in the output variable for the live MyBB application.

## Evaluation Access Account

- MyBB application Administrator Account:
    - Username: admin
    - Password: 1234

## Resources created
- 1 ECS cluster
- "x" amount of instances in AutoScaling Group
- 1 Application Load Balancer
- 1 MySQL RDS MultiAZ
- 1 EFS file system
