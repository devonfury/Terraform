variable "region" {
  description = "The AWS Region"
  default = "us-east-2"  
}

variable "ami" {
  type="map"
  default = {
    us-east-1 = "ami-0e1c7fc5d95c3b688"
    us-east-2 = "ami-0b32ec75f2cd21d30"
  }
  description = "The AMI to use."
}
