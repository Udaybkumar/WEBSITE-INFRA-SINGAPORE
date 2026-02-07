# 🇸🇬 Website Infrastructure on AWS EKS (Singapore)

This repository contains the complete **Infrastructure as Code (IaC)** and **CI/CD pipeline** to deploy a high-availability static website on Amazon Elastic Kubernetes Service (EKS) in the Singapore region (`ap-southeast-1`).

The project demonstrates a production-grade DevOps workflow using **Terraform** for infrastructure provisioning and **GitHub Actions** for continuous deployment.

---

## 🏗 Architecture Overview

The infrastructure is built from scratch to ensure security, scalability, and automation:

* **Cloud Provider:** AWS (Singapore Region)
* **Orchestrator:** Amazon EKS (Kubernetes v1.29)
* **Compute:** Managed Node Group (Instance type: `t3.small`)
* **Networking:** Custom VPC with Public/Private subnets & NAT Gateways.
* **Traffic Management:** AWS Application Load Balancer (ALB) managed via Ingress.
* **Container Registry:** Amazon ECR (Elastic Container Registry).
* **Web Server:** Nginx (Alpine-based Docker image).

---

## 📂 Project Structure

```text
├── .github/workflows/    # CI/CD Pipeline (GitHub Actions)
│   └── deploy.yml        # Automates Build -> Push -> Deploy
├── src/                  # Source code for the website
│   ├── css/
│   ├── js/
│   ├── images/
│   └── index.html        # Main entry point
├── main.tf               # Terraform Infrastructure definition (VPC, EKS, IAM, ECR)
├── k8s-manifest.yaml     # Kubernetes Deployment, Service, & Ingress definitions
├── Dockerfile            # Instructions to containerize the website
├── .dockerignore         # Excludes sensitive/unwanted files from Docker build
├── .gitignore            # Excludes Terraform state & plugins from Git
└── README.md             # Project documentation
Added Cloud watch
