# Task-10: Blue/Green Deployment on AWS ECS using CodeDeploy (Terraform + CI/CD)

## Project Overview
This project demonstrates implementing Blue/Green deployment for a Strapi application running on AWS ECS Fargate, managed entirely through Terraform and automated using GitHub Actions.

In this version, AWS CodeDeploy is integrated with ECS to enable controlled traffic shifting between Blue and Green environments using an Application Load Balancer (ALB). The deployment strategy ensures zero-downtime updates with automatic rollback capability.

---

## Architecture Overview
```text
      GitHub Push
         ↓
   GitHub Actions (CI)
         ↓
   Docker Image Build
         ↓
      Amazon ECR
         ↓
   GitHub Actions (CD)
         ↓
   Terraform Apply
         ↓
ECS Cluster (Fargate Spot)
         ↓
 AWS CodeDeploy (Blue/Green)
         ↓
 Application Load Balancer
   (Blue & Green Target Groups)
         ↓
Strapi Application Running
```

---

## Technologies Used
- Strapi (Node.js Headless CMS)
- Docker
- Terraform (Modular IaC)
- GitHub Actions (CI/CD)
- Amazon ECS (Fargate Spot)
- Amazon ECR
- Amazon RDS (PostgreSQL)
- Application Load Balancer (ALB)
- AWS CodeDeploy (ECS Blue/Green)
- AWS VPC & Security Groups

---

## Infrastructure Provisioned via Terraform
- ECS Cluster
- ECS Task Definition
- ECS Service (Deployment Controller: CODE_DEPLOY)
- Amazon ECR Repository
- Amazon RDS PostgreSQL Instance
- DB Subnet Group
- Application Load Balancer
- Blue Target Group
- Green Target Group
- ALB Listener (Port 80)
- CodeDeploy Application
- CodeDeploy Deployment Group
- Networking (Default VPC & Subnets)

Infrastructure is organized using a modular Terraform structure for better maintainability and 
scalability.

---

## CI/CD Workflow
### CI Pipeline
- Builds Docker image
- Pushes image to Amazon ECR
- Generates image tag

### CD Pipeline
- Runs Terraform
- Creates new ECS task definition revision
- CodeDeploy triggers Blue/Green deployment
- Traffic shifts from Blue → Green
- Old tasks terminated after successful deployment

---

## Blue/Green Deployment Configuration
- Deployment Type: Blue/Green
- Deployment Strategy: CodeDeployDefault.ECSCanary10Percent5Minutes
- Traffic Shift: 10% → 100%
- Automatic Rollback: Enabled
- Old Task Termination: Enabled (after successful deployment)
- Deployment Controller: CODE_DEPLOY

---

## Repository Structure
```text
.
├── strapi/
│   ├── Dockerfile
│   ├── package.json
│   └── config/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── backend.tf
│   └── modules/
│       ├── ecs/
│       ├── rds/
│       ├── ecr/
│       ├── alb/
│       └── codedeploy/
│
└── .github/
    └── workflows/
        ├── ci.yml
        └── deploy.yml
```

---

## Final Result
- Strapi deployed using Blue/Green strategy
- Traffic managed through ALB with Blue & Green target groups
- Zero-downtime deployment enabled
- Automatic rollback configured
- CI/CD pipeline fully automated
- Logs and metrics available in CloudWatch

---

## Author
**Jaspal Gundla**
