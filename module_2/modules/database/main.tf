resource "random_id" "random_16" {
  byte_length = 16 * 3 / 4
}

locals {
  db_password = random_id.random_16.b64_url
}

resource "aws_db_instance" "database" {
  allocated_storage = 10
  engine = "postgresql"
  engine_version = "9.6.19"
  instance_class = "db.t2.micro"
  identifier = "${var.namespace}-db-instance"
  name = "contacts"
  username = "admin"
  password = local.db_password
  skip_final_snapshot = true
  db_subnet_group_name = var.vpc.databse_subnet_group
  vpc_security_group_ids = [var.sg.db]
}
