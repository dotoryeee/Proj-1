resource "aws_security_group" "public_ec2" {
  vpc_id = aws_vpc.main.id

  name = "SG-for-server-nodes"
  description = "allow ssh http docker-swarm"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    self = true
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    "Name" = "SG-EC2-webserver"
  }
}

#-------------RDS-------------------
resource "aws_security_group" "rds" {
  vpc_id = aws_vpc.main.id
  name = "SG-for-RDS"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [
      aws_security_group.public_ec2.id]
  }
}