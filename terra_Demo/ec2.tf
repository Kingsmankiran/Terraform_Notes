resource "aws_instance" "intro" {
ami = "ami-007855ac798b5175e"
instance_type = "t2.micro"
key_name = "key"
vpc_security_group_ids = [aws_security_group.allow_tls.id]
tags = {
 Name = "terraform_instance"
}
}