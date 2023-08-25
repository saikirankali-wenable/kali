provider "aws" {
  region = "us-west-2"
  
}


resource "aws_instance" "ubuntu_priv" {
  ami = var.ami
  instance_type = "t2.micro"
  key_name = "devops"
  subnet_id = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.u_sg.id]
  tags = {
    name = "task"
  }
  
}
resource "aws_key_pair" "devops" {
  key_name = "devops"
  public_key = tls_private_key.rsa.public_key_openssh
  
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "devopskey" {
  content = tls_private_key.rsa.private_key_pem
  filename = "devopskey"
  
}
