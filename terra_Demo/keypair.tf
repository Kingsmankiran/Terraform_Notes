resource "aws_key_pair" "my_key" {
  key_name   = "key1"
  public_key = file("key1.pub")
}

resource "aws_instance" "myec2" {
  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "kiran"
  }
provisioner "file"{
source="web.sh"
destination="/tmp/web.sh"
}
provisioner "remote-exec" {
inline=[
"chmod 777 /tmp/web.sh",
"sudo /tmp/web.sh"
]
}
connection{
user="ubuntu"
private_key=file("key1")
host=self.public_ip
}
}