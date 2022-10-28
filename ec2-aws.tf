resource "aws_instance" "my-webserver" {
    ami           = var.image-id
    instance_type = var.instance-type
    key_name      = aws_key_pair.challenge-kp.id

    tags = {
        Name = "demo-terraform"
    }

    network_interface {
      network_interface_id = aws_network_interface.foo.id
      device_index         = 0 
    }

    credit_specification {
      cpu_credits = "unlimited"
    }
}