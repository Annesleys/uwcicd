terraform {
  backend "s3" {
    bucket = "uwartifacts"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
    profile = "default"
  }
}
