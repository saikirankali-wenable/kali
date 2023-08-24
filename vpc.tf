resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "myvpc"
  }
  
}
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name =  "public subnet"
  }
  
}
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/26"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private subnet"
  }
  
}
resource "aws_internet_gateway" "u_IGW" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "IGW"
  }
  
}
resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "public RT"
  }
  route {  
    cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.u_IGW.id"
  }
  
  
}
resource "aws_route_table_association" "pub_assoc" {
  subnet_id = "aws_subnet.public_subnet.id"
  route_table_id = "aws_route_table.pub_RT.id"
  
}
resource "aws_eip" "nat_eip" {
  vpc = true
} 
resource "aws_nat_gateway" "nat" {
  allocation_id = "aws_eip.nat_eip.id"
  subnet_id = "aws_subnet.public_subnet.id"
  
  
}

resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "private subnet"
  }
  route  {
    cidr_block = "0.0.0.0/0"
  gateway_id = "aws_nat_gateway.nat.id"
  }
  
}
resource "aws_route_table_association" "priv_assoc" {
  subnet_id = "aws_subnet.private_subnet.id"
  route_table_id = "aws_route_table.private_RT.id"
  
}
