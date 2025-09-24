# terraform provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

#create a aws instance

resource "aws_instance" "s1" {
  ami           = "ami-02d26659fd82cf299"  //ami id in the same resion
  instance_type = "t3.micro"
  
  // you can also remove tag part from the code
   tags = {  
    Name = "server1"  //Name of your instance    
  }
}
