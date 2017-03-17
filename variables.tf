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
    us-west-1 = "ami-16efb076"
    us-west-2 = "ami-a58d0dc5"
  }
}
variable "key_pairs" {
  type = "map"
  default = {
    us-east-1 = "erwin_test2"
    us-east-2 = "erwin_us-east-2"
    us-west-1 = "erwin_test2"
    us-west-2 = "erwin_us-west-2"
  }
}
