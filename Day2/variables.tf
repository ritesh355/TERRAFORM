# Input variable with default value
variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "my-terraform-instance"
}

# Variable without default (must be passed in)
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

# Environment variable usage (TF_VAR_ syntax will auto-pick)
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

