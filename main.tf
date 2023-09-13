terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
  # Configuration options
}

variable "instance_type"{}


resource "aws_instance" "web" {
  count = 2
  ami           = "ami-0899663faf239dd8a"
  instance_type = var.instance_type

  tags = {
    Name = "${terraform.workspace}-${count.index}"
  }
}