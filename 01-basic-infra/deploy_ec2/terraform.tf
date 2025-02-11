terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
      version = "3.4.3"
    }
    random = {
        source = "hashicorp/random"
        version = "3.1.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.5"
    }
    
  }
}

provider "http" {
  # Configuration options
}
provider "aws" {
  region  = "ap-south-1"
  profile = "myprofile"
}
