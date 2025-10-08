provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-052064a798f08f0d3"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }

    lifecycle {
      create_before_destroy = true
    }
}


/* base code
provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-052064a798f08f0d3"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloEarth"
    }
}


*/