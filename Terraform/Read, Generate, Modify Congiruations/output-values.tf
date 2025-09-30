resource "aws_eip" "lb" {
  domain   = "vpc"
}

output "public_ip" {
    value = aws_eip.lb.public_ip # id public_ip attribute is not specify tahn tha show all attributes
  
}