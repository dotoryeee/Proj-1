#---------RDS 서브넷 그룹-----------
resource "aws_db_subnet_group" "_" {
  name = "subnet_for_rds"
  subnet_ids = [
    aws_subnet.private-2a.id,
    aws_subnet.private-2c.id
  ]
}
#---------RDS 인스턴스-----------
resource "aws_db_instance" "db" {
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  allocated_storage   = 10
  engine              = "mysql"
  engine_version      = "5.7"

  identifier = var.RDS["identifier"]
  username   = var.RDS["username"]
  password   = var.RDS["password"]
  name       = var.RDS["name"]

  db_subnet_group_name = aws_db_subnet_group._.name

  vpc_security_group_ids = [aws_security_group.rds.id]
}