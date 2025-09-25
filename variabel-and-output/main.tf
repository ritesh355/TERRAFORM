provider "aws" {
  region = var.region
}

resource "aws_instance" "demo" {
  ami           = "ami-0c55b159cbfafe1f0" # update with valid AMI for your region
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

