resource "aws_instance" "ec2" {

    ami = "ami-08982f1c5bf93d976"
    instance_type = "t2.micro"
    count = 3
    tags = {
      Name = "payment-${count.index}"

    }
  
}



# if we want to creat user name with a b and c
variable "users" {
    type = list 
    default = ["a","b","c"]
  
}

resource "aws_iam_user" "this" {

    name = var.users[count.index]
    count = 3  
}

