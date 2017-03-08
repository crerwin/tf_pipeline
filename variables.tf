variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-2"
}
variable "amis" {
  type = "map"
  default = {
    us-east-1 = "ami-f4cc1de2"
    us-east-2 = "ami-fcc19b99"
  }
}
