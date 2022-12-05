resource "random_password" "rds_alpha_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "alpha" {
  allocated_storage         = 10
  db_name                   = "db_proj_alpha"
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t3.micro"
  username                  = "master"
  password                  = random_password.rds_alpha_password.result
  parameter_group_name      = "default.mysql5.7"
  deletion_protection       = true
  publicly_accessible       = false
  backup_retention_period   = 7
  auto_minor_version_upgrade = true
}

resource "random_password" "rds_beta_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "beta" {
  allocated_storage         = 10
  db_name                   = "db_proj_beta"
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t3.micro"
  username                  = "master"
  password                  = random_password.rds_beta_password.result
  parameter_group_name      = "default.mysql5.7"
  deletion_protection       = true
  publicly_accessible       = false
  backup_retention_period   = 7
  auto_minor_version_upgrade = true
}