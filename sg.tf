resource "aws_security_group" "u_sg" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "sg"
  }
  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "To connect to instance"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


  }
}