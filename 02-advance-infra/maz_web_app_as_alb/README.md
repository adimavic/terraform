# Advanced Infrastructure Projects with Terraform & AWS 🚀

## Overview
This repository contains advanced infrastructure projects using **Terraform**, **AWS**, and **DevOps best practices**. These projects cover **high availability, automation, security, and scalability**.

## 📌 Projects List

### 1️⃣ Highly Available Web Application with ALB & Auto Scaling
**Skills Covered:** VPC, ALB, Auto Scaling Groups, RDS, Route 53  
**Terraform Modules:** EC2, S3, ALB, ASG, RDS  

#### 🔹 Project Overview:
- Deploy a **multi-tier web application**.
- Use **Auto Scaling Groups (ASG)** for dynamic scaling.
- Deploy an **Application Load Balancer (ALB)**.
- Store data in **RDS MySQL/PostgreSQL**.
- Use **Route 53** for domain management.

🔹 **Bonus:** Implement **SSL (HTTPS) using ACM**.

---

### 2️⃣ AWS EKS (Kubernetes) Cluster with Helm & CI/CD
**Skills Covered:** Kubernetes, Helm, Terraform, CI/CD (GitHub Actions/GitLab)  
**Terraform Modules:** EKS, IAM, ALB, Node Groups  

#### 🔹 Project Overview:
- Deploy an **EKS cluster**.
- Use **IAM roles for service accounts**.
- Deploy a **Helm chart** for an app (Nginx, Prometheus, etc.).
- Set up **CI/CD pipeline** (GitHub Actions/GitLab).
- Enable **CloudWatch monitoring & logging**.

🔹 **Bonus:** Implement **service mesh (Istio)**.

---

### 3️⃣ Serverless Application with AWS Lambda & API Gateway
**Skills Covered:** AWS Lambda, API Gateway, DynamoDB, IAM  
**Terraform Modules:** Lambda, API Gateway, DynamoDB, S3  

#### 🔹 Project Overview:
- Build a **serverless REST API** using AWS Lambda & API Gateway.
- Store data in **DynamoDB**.
- Use **S3 for static file hosting**.
- Implement **IAM policies & roles**.
- Deploy Lambda **via Terraform & AWS SAM**.

🔹 **Bonus:** Implement **JWT authentication** for API security.

---

### 4️⃣ AWS Multi-Region Disaster Recovery Setup
**Skills Covered:** S3 Cross-Region Replication, RDS Multi-AZ, Route 53 Failover  
**Terraform Modules:** S3, RDS, Route 53, CloudFront  

#### 🔹 Project Overview:
- Configure **multi-region replication** for S3.
- Deploy an **RDS instance with cross-region failover**.
- Set up **Route 53 health checks**.
- Use **CloudFront CDN** for content distribution.

🔹 **Bonus:** Implement **AWS Backup & Restore policies**.

---

### 5️⃣ AWS Landing Zone with IAM & Security Best Practices
**Skills Covered:** AWS Organizations, IAM, Security Hub, SCP  
**Terraform Modules:** IAM, Security Hub, GuardDuty, AWS Config  

#### 🔹 Project Overview:
- Create an **AWS Landing Zone** using best security practices.
- Use **IAM roles & policies**.
- Enable **AWS Security Hub, GuardDuty & Config**.
- Set up **Service Control Policies (SCPs)**.
- Deploy a **budget alert system**.

🔹 **Bonus:** Implement **AWS Organizations & Multi-Account Strategy**.

---

### 6️⃣ Terraform Infrastructure Automation with Atlantis
**Skills Covered:** Terraform GitOps, Atlantis, CI/CD, Security  
**Terraform Modules:** GitHub Actions, Atlantis, AWS IAM  

#### 🔹 Project Overview:
- Set up **Atlantis** to manage Terraform via pull requests.
- Automate infrastructure deployment using **GitOps**.
- Implement **RBAC** for different users.
- Use **GitHub Actions/GitLab Pipelines** for validation.

🔹 **Bonus:** Deploy **custom Terraform modules**.

---

### 7️⃣ AWS VPC with Private & Public Subnets, VPN & NAT Gateway
**Skills Covered:** Networking, VPN, NAT Gateway, Security Groups  
**Terraform Modules:** VPC, Subnets, VPN, Route Tables  

#### 🔹 Project Overview:
- Create a **secure AWS VPC**.
- Set up a **VPN connection**.
- Use a **NAT Gateway** for private instances.
- Implement **Network ACLs & Security Groups**.

🔹 **Bonus:** Deploy a **Bastion Host** for SSH access.

---

## 💡 Contributing
Feel free to contribute by adding more projects, improving Terraform code, or refining documentation. Open a PR! 🚀

## 📜 License
This project is open-source and available under the **MIT License**.

---

### 🚀 **Which Project Interests You the Most?**
Pick a project and start building! Let me know if you need help. 😊
