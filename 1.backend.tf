# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket       = "terraformday1fun"
    prefix       = "terraform/state"
    credentials  = "seahawks25-9bb3079248f9.json"

  }
}


 
