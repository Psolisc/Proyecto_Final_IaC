resource "aws_vpc" "main_vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "ChallengeVPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "172.16.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "ChallengeVPC"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "VM_primary_network_interface"
  }
}

resource "aws_network_interface" "foo2" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.200"]

  tags = {
    Name = "NGINX_primary_network_interface"
  }
}