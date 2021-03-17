variable "region" {
  type = string
}

variable "ami_image" {
  type = "map"
  default = {}
}

variable "availability_zone" {
  type = list(string)
  default = ["ap-northeast-2a"]
}