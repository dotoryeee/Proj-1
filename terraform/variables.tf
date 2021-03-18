variable "region" {
  type = string
}

variable "ami_image" {
  type = map(string)
  default = {}
}

variable "availability_zone" {
  type = list(string)
  default = ["ap-northeast-2a"]
}

variable "RDS" {
  type = map(string)
}