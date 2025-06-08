 
terraform {
  backend "gcs" {
    bucket       = "terraformday1fun"
    prefix       = "terraform/state"
    credentials  =  

  }
}


 
