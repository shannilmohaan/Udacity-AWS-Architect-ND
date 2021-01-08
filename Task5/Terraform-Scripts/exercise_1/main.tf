terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 2.70"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "us-east-1"
}

# Create 4 t2.micro instances
resource "aws_instance" "Udacity_T2"{
    ami = "ami-0be2609ba883822ec"
    instance_type = "t2.micro"
    count = 4
    subnet_id ="subnet-0791374483dc984f2"
    tags = {
        name = "Udacity T2"
    }
}
# create 2 m4.large instances
/*resource "aws_instance" "Udacity_M4"{
    ami = "ami-0be2609ba883822ec"
    instance_type = "m4.large"
    count = 2
    subnet_id ="subnet-0791374483dc984f2"
    tags = {
        name = "Udacity M4"
    }
}*/