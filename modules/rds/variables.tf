variable "private_subnet_1" {}
variable "private_subnet_2" {}
variable "rds_sg_id" {}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}
