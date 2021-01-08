terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
    profile = "default"
    region = var.region
}

resource "aws_lambda_function" "lambda_terraform_deployment_example" {
   function_name = "TerraformLambdaDeployment"

   # The bucket name as created with "aws s3api create-bucket"
   s3_bucket = var.bucket
   s3_key    = var.key

   # "lambda" is the filename within the zip file (lambda.py) and "lambda_handler"
   # is the name of the property under which the handler function was
   # exported in that file.
   handler = "lambda.lambda_handler"
   runtime = "python3.8"

   role = aws_iam_role.lambda_exec.arn
}

 # IAM role which dictates what other AWS services the Lambda function
 # may access.
resource "aws_iam_role" "lambda_exec" {
   name = "serverless_lambda_terraform"

   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}