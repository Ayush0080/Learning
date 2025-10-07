resource "aws_instance" "terraform_demo" {
    ami = "ami-08982f1c5bf93d976"
    instance_type = "t2.micro"
    tags = {
    Name = "demo-tf"
  }

  
}