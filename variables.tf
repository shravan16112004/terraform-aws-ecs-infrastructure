variable "aws_region" {
  default = "us-west-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}
