# DevOps Stage 4 - Terraform & Ansible Deployment

This repository contains Terraform configurations and Ansible playbooks for deploying a containerized microservices TODO application on AWS.

## Project Structure

I'll create a clear project structure to help you organize all the files properly. This will provide a roadmap for where to place each file I've shared with you.

```markdown
devops-deployment/
│
├── terraform/
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Variable definitions
│   ├── terraform.tfvars     # Variable values
│   └── .gitignore           # Ignores terraform state files, etc.
│
├── ansible/
│   ├── inventory.ini        # Will be generated by Terraform
│   ├── playbook.yml         # Main Ansible playbook
│   │
│   ├── roles/
│   │   ├── common/
│   │   │   └── tasks/
│   │   │       └── main.yml  # Common setup tasks
│   │   │
│   │   ├── docker/
│   │   │   └── tasks/
│   │   │       └── main.yml  # Docker installation tasks
│   │   │
│   │   ├── app_deployment/
│   │   │   └── tasks/
│   │   │       └── main.yml  # Application deployment tasks
│   │   │
│   │   └── traefik/
│   │       └── tasks/
│   │           └── main.yml  # Traefik configuration tasks
│   │
│   └── .gitignore           # Ignores inventory.ini (since it's generated)
│
└── README.md                # Project documentation
```

## Prerequisites

- AWS account with appropriate permissions
- Terraform installed (v1.0.0+)
- Ansible installed (v2.9+)
- SSH key pair
- Domain name registered in Route53

## Configuration

1. Update credentials in \`terraform/terraform.tfvars\`
2. Run \`terraform init\` and \`terraform apply\` in the terraform directory
3. The application will be automatically deployed by Ansible

## Deployment

Deploy the entire infrastructure and application with a single command:

```bash
terraform init
terraform apply -auto-approve
```

This will:
1. Provision AWS infrastructure (VPC, subnet, security groups, EC2 instance)
2. Create Ansible inventory file
3. Run Ansible playbook to configure the server
4. Deploy the application with Docker Compose and Traefik

## Infrastructure Components

- **AWS Region**: us-west-2 (Oregon)
- **EC2 Instance**: t2.micro with Ubuntu 22.04 LTS
- **Security**: Security group allowing ports 22 (SSH), 80 (HTTP), and 443 (HTTPS)
- **Domain**: Configured with Route53
- **SSL/TLS**: Automated with Traefik and Let's Encrypt

## Application

The application is deployed from [https://github.com/JaMuad/DevOps-Stage-4.git](https://github.com/JaMuad/DevOps-Stage-4.git) using Docker Compose.

## Access

Once deployed, the application will be accessible at:
- https://muadmaalim.buzz

## Cleanup

To destroy all resources:

```bash
terraform destroy -auto-approve
```

## Additional Information

- Ansible roles:
  - `dependencies`: Installs Docker, Docker Compose, and other dependencies
  - `deployment`: Clones the repository and deploys the application

- Terraform creates:
  - VPC and networking
  - Security groups
  - EC2 instance
  - DNS records in Route53