resource "aws_vpc" "main_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "ChallengeVPC"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "ChallengeVPC"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}