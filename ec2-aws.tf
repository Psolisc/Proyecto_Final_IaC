resource "aws_instance" "my-VM1" {
  ami           = var.image-id
  instance_type = var.instance-type
  key_name      = aws_key_pair.challenge-kp.id

  tags = {
    Name = "PF-IaC"
  }

  network_interface {
    network_interface_id = aws_network_interface.my-VM1.id
    device_index         = 0 
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

resource "aws_instance" "my-webserver" {
  ami           = var.image-id
  instance_type = var.instance-type
  key_name      = aws_key_pair.PF_IaC-kp.id
  user_data     = file("setup-nginx.sh")

  tags = {
    Name = "PF-IaC-Ngninx-Server-Automatizado"
  }

  network_interface {
    network_interface_id = aws_network_interface.my-webserver.id
    device_index         = 0 
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
