# Provider - tells Terraform to use AWS
provider "aws" {
  region = "us-east-1"
}

# Security group - allows SSH and HTTP
resource "aws_security_group" "web_server" {
  name        = "web-server-sg"
  description = "Allow SSH and HTTP"

  # Allow SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServerSG"
  }
}

# EC2 instance with nginx auto-installed
resource "aws_instance" "web_server" {
  ami                    = "ami-0bb84b8ffd87024d8"  # Amazon Linux 2
  instance_type          = "t2.micro"
  key_name               = "keypair1"  # CHANGE to your key name
  vpc_security_group_ids = [aws_security_group.web_server.id]
   associate_public_ip_address = true

  # Script that runs when EC2 boots
  user_data = <<-EOF
            #!/bin/bash
            # Fix DNS
            echo "nameserver 8.8.8.8" > /etc/resolv.conf
            echo "nameserver 1.1.1.1" >> /etc/resolv.conf
            
            # Now install nginx
            yum update -y
            yum install nginx -y
            systemctl start nginx
            systemctl enable nginx
            echo "<h1>Deployed with Terraform!</h1>" > /usr/share/nginx/html/index.html
            EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}

# Output the public IP so you can access it
output "web_server_ip" {
  value       = aws_instance.web_server.public_ip
  description = "Public IP of web server - visit http://THIS_IP"
}