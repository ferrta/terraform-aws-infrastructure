# Terraform AWS Infrastructure

Infrastructure as Code examples using Terraform and AWS.

## Projects

### Basic EC2 Instance
**Location:** `basic-ec2/`

Deploys a single EC2 instance with SSH access.

**Resources created:**
- EC2 instance (t2.micro)
- Security group allowing SSH (port 22)
- SSH key pair configuration

**Usage:**
```bash
cd basic-ec2
terraform init
terraform plan
terraform apply
terraform destroy  # Clean up when done
```

**What I learned:**
- Terraform workflow (init, plan, apply, destroy)
- AWS provider configuration
- EC2 instance deployment
- Security group configuration
- SSH key pair management
- Debugging IAM permissions and AWS CLI setup

## Skills Demonstrated
- Infrastructure as Code (Terraform)
- AWS resource management
- Version control (Git/GitHub)
- Problem-solving and troubleshooting

## Technologies
- Terraform
- AWS (EC2, Security Groups, IAM)
- Git/GitHub

---

*Built while learning DevOps and cloud automation practices.*
