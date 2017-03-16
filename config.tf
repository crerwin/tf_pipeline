terraform {
  backend "local" {
    path = "/var/lib/jenkins/tfstate/terraform.tfstate"
  }
}
