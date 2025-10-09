resource "aws_instance" "myec2" {
   ami = "ami-08982f1c5bf93d976"
   instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> server_ip.txt"
   }
}