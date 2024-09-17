terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64.0"
    }
  }
}

provider "aws"{
    shared_config_files = ["/root/.aws/config"]
    shared_credentials_files =["/root/.aws/credentials"]
  profile = "admin"
}
