# Terraform CRUD Demonstration
Terraform AWS Lambda + API Gateway demonstration of a CRUD application

## Introduction
This project is a demonstration for a way to build your Terraform Modules so that they can become reusable across projects. This way also allows for simple migrations to a module provider such as Git or S3.

This demonstration deploys the following on AWS:
- One DynamoDB table;
- One Lambda function and one layer;
- One role to go with the Lambda function;
- One API Gateway with two resources and a total of six methods;

This is a very, very simple CRUD -Create Read Update Delete- application that does not provide basic features because it is meant as a demonstration.

# Considerations

There was no intention of following the best practices in terms of AWS resource management or Terraform provisioning. Comments are limited out of the meaningful section of this code and the explanation can be found in the following [blog post (not published yet)](#).
