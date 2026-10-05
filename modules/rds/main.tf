resource "aws_db_subnet_group" "db_subnet_group" {
  name = "main-db-subnet-group"

  subnet_ids = [
    var.private_subnet_1,
    var.private_subnet_2
  ]
}

resource "aws_db_instance" "postgres" {
  identifier = "main-postgres-db"

  engine         = "postgres"
  engine_version = "15"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  username = "postgres"
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  vpc_security_group_ids = [
    var.rds_sg_id
  ]

  publicly_accessible = false
  skip_final_snapshot = true
}
