resource "aws_instance" "ec2" {

    ami = "ami-08982f1c5bf93d976"
    instance_type = "t2.micro"
    count = 3

  
}