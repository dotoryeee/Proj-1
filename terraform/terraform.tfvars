region = "ap-northeast-2"

ami_image = {
  amazon_linux_2 = "ami-0e17ad9abf7e5c818"
  ubuntu_20_04 = "ami-00f1068284b9eca92"
  redhat_8 = "ami-07270d166cdf39adc"
}

availability_zone = [
  "ap-northeast-2a",
  "ap-northeast-2c"
]

RDS = {
  identifier = "myapp" #RDS 식별자
  username   = "root" #접속 User
  password   = "password" #접속 비밀번호
  name       = "humandb" #기본 DB
}