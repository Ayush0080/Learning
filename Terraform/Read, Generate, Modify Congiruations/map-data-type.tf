variable "my-var" {
    type = map 
    default = {

        name = "abc"
        value = "123"
    }
  
}

output "output" {
value = var.my-var
  
}