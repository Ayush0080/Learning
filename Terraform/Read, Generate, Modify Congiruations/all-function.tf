provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-08a0d1e16fc3f61ea"
    "us-west-2" = "ami-0b20a6f09484773af"
    "ap-south-1" = "ami-0e1d06225679bc1c5"
  }
}


resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region) # lookup({"us-east-1" = "ami-08a0d1e16fc3f61ea","us-west-2" = "ami-0b20a6f09484773af","ap-south-1" = "ami-0e1d06225679bc1c5"},"us-east-1")
   instance_type = "t2.micro"
   count = length(var.tags)# length(["firstec2","secondec2"])= 2

   tags = {
     Name = element(var.tags,count.index) #element(["firstec2","secondec2"],1)
     CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ",timestamp())#formatdate("DD MMM YYYY hh:mm ZZZ", "2024-06-17T17:51:34Z")
   }
}



