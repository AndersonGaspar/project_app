resource "aws_key_pair" "devops" {
  key_name   = "key_devops"
  public_key = file("key.pub")
}

resource "aws_instance" "devops" {
  key_name      = aws_key_pair.devops.key_name
  ami           = "ami-047a51fa27710816e"
  instance_type = "t2.small"

  tags = {
    Name = "devops"
    Env = "dev"
  }

  vpc_security_group_ids = [
    aws_security_group.devops.id
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("key.pub")
    host        = self.public_ip
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 30
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.devops.public_ip} >> ./Jenkins/hosts"
  }
}

resource "aws_eip" "devops" {
  vpc      = true
  instance = aws_instance.devops.id
}