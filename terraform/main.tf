provider "aws" {
  region = var.region
}

resource "aws_instance" "devops_lab" {
  ami                    = "ami-0df7a207adb9748c7" # Amazon Linux 2 (Singapore)
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_basic.id]

  tags = {
    Name = "devops-lab-instance"
  }
}

resource "aws_security_group" "allow_basic" {
  name        = "devops-lab-sg"
  description = "Allow SSH and HTTP/S access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip" {
  value = aws_instance.devops_lab.public_ip
}