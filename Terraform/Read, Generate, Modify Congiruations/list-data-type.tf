

resource "aws_instance" "web" {
    ami = "ami-08982f1c5bf93d976"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ "sg-07b1530a4678ca5af","sg-07b1530a4678ca5al" ]
  
}