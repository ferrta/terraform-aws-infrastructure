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

  ### EC2 with Nginx Web Server
**Location:** `ec2-with-nginx/`

Automated web server deployment with nginx pre-installed and configured.

**Resources created:**
- EC2 instance (t2.micro, Amazon Linux 2023)
- Security group (SSH port 22 + HTTP port 80)
- Nginx web server with custom welcome page

**Features:**
- Fully automated server setup via user_data
- DNS configuration for package installation
- Outputs public IP for immediate access
- One-command deployment

**Usage:**
```bash
cd ec2-with-nginx
terraform init
terraform apply
# Visit http://OUTPUT_IP in browser
terraform destroy  # Clean up when done
```

**What I learned:**
- User data scripting for automated configuration
- Debugging cloud-init and DNS issues
- Multi-port security group rules
- Complete infrastructure + application automation
- Reading AWS logs (/var/log/cloud-init-output.log)

**Challenges solved:**
- Resolved DNS resolution issues in user_data
- Debugged package installation failures
- Configured automated nginx deployment

---

*Built while learning DevOps and cloud automation practices.*
