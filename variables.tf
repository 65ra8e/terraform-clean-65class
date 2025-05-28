variable "project" {
  type                            = string
  default                         = "seahawks25"
}
 

variable "region1" {
  type                            = string
  default                         = "us-west1"
  
}
 
variable "region2" {
  type                            = string
  default                         = "asia-northeast1"
  
}

 

variable "subnetwork" {
   type                           = map(map(string))
   default                        = {
     hqseattle                    = {
       name                       = "hqseattle"
       ip_cidr_range              = "10.206.77.0/24"
       region                     = "us-west1"
       zone                       = "us-west1-a"
   }

    tokyo-proxy                   = {
        name                      = "tokyo-proxy"
        ip_cidr_range             = "10.206.97.0/24"
        region                    = "asia-northeast1"
        zone                      = "asia-northeast1-a"
    }

    tokyo2-proxy                   = {
        name                      = "tokyo2-proxy"
        ip_cidr_range             = "10.206.117.0/24"
        region                    = "asia-northeast1"
        zone                      = "asia-northeast1-a"
    }

     
   }
  }

  