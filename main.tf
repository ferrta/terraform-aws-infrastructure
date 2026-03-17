# Basic EC2 Instance Deployment
# 
# Before running:
# 1. Replace "your-key-name" with your actual AWS key pair name
# 2. Optionally change region in provider block
# 3. Optionally change AMI ID if using different region
#
# Usage:
#   terraform init
#   terraform plan
#   terraform apply
#   terraform destroy

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "your-key-name"  # CHANGE THIS
  
  tags = {
    Name = "TerraformTest"
  }
}