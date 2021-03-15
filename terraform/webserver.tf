resource "aws_key_pair" "dotoryeee" {
  key_name = "dotoryeee"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD5D5mHSD/vdgcGmh6Kd57DqLxebcvbrUsHj8DYDW0+9MSvvK874Bm4hpqHliYze/ht7VnzL5+A5qZkCevKGBDeJNmR/QDHccCsCfRuyEmzMlvj3SxzYSH2N4lBG6eZZbQ+0yRl7ny3aeyol5boDkztLZ/PZwVR5IH6BgsNiGClSDtuf2CYoKN7hQufjeuCDcLlQa+ItFa4abMe/mWtMeEh7+ZpC+0KAFFvqY80OCtuUdqq7tcP8uHzQy9mPKvKBieJYitUoStjFEMAro1v34u6193Qgk6DAhyMom4GmLc2+tTyKMsvBlRKUOb87F+2zsATX3Ahz9cMpEkfPTkY15V dotoryeee@i5-6500"
}

resource "aws_instance" "public_01" {
  ami = "ami-006e2f9fa7597680a"
  instance_type = "t2-mirco"

  subnet_id = aws_subnet.public-2a.id

  security_groups = [
    aws_security_group.public_ec2.id]

  key_name = aws_key_pair.dotoryeee.key_name

  tags = {
    Name = "talentpool-webserver"
  }
}

resource "aws_instance" "public_02" {
  ami = "ami-006e2f9fa7597680a"
  instance_type = "t2-mirco"

  subnet_id = aws_subnet.public-2c.id

  security_groups = [
    aws_security_group.public_ec2.id]

  key_name = aws_key_pair.dotoryeee.key_name

  tags = {
    Name = "talentpool-webserver"
  }
}