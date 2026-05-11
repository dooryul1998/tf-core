terraform {
  required_version = ">=1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_security_group" "web" {
  name = "tf-core-lab01-sg-web"

  tags = {
    Name = "tf-core-lab01-sg-web"
  }
}

output "sg" {
  value = aws_security_group.web.id
}