resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-talent-pool"
  }
}

resource "aws_subnet" "public-2a" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-2a-talent-pool"
  }
}

resource "aws_subnet" "public-2c" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-2c-talent-pool"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "RT-public-talent-pool"
  }
}

resource "aws_route_table_association" "public-asso-2a" {
  subnet_id = aws_subnet.public-2a.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public-asso-2c" {
  subnet_id = aws_subnet.public-2c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-talent-pool"
  }
}

resource "aws_route" "default" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_subnet" "private-2a" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "private-2a"
  }
}
resource "aws_subnet" "private-2c" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "private-2c"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "RT-private-talent-pool"
  }
}

resource "aws_route_table_association" "private-asso-2a" {
  subnet_id = aws_subnet.private-2a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-asso-2c" {
  subnet_id = aws_subnet.private-2c.id
  route_table_id = aws_route_table.private.id
}
