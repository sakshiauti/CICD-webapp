provider "aws" {
  region = "us-east-1"
}

//s3 bucket for EB app versions
resource "aws_s3_bucket" "eb_bucket" {
  bucket = "my-eb-app-bucket-${random_id.suffix.hex}"
}
resource "random_id" "suffix" {
  byte_length = 4
}
//Elastic Beanstalk application
resource "aws_elastic_beanstalk_application" "app" {
  name = "eb-app"
  description = "Simple Node.js application"
}

//Elastic Beanstalk environment
resource "aws_elastic_beanstalk_environment" "env" {
  name                = "eb-env"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v5.8.6 running Node.js 18"

    setting {
        namespace = "aws:elasticbeanstalk:environment"
        name      = "ServiceRole"
        value     = "aws-elasticbeanstalk-service-role"
    }
  setting {
    namespace = "aws:autoScaling:launchConfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}