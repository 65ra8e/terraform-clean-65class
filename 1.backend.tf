# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket       = "terraformday1fun"
    prefix       = "terraform/state"
    credentials  = 

  }
}


 
