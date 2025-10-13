# terraform-modules
Terraform modules to manage AWS and local home server infrastructure

# ☁️ Terraform Infrastructure Modules

This repository contains Terraform modules, documentation, and visual architecture assets for deploying a **hybrid infrastructure platform** supporting both **cloud (AWS)** and **on-premise** environments.  
It is organized into modular components for reusability and clarity across deployment layers, including networking, containerized applications, data warehouses, and user authentication services.

## 🚀 Overview

This repository supports both **cloud-native** and **on-premise** infrastructure deployments using Terraform.  
Each module is self-contained and reusable, making it possible to mix and match configurations depending on the environment.

Key features:
- Modular design for AWS and on-prem environments  
- Infrastructure-as-code using Terraform  
- Visual documentation for system design and networking  
- Integrated documentation site built with MkDocs  

---

## ⚙️ Setup

### Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) ≥ 1.6  
- [Python](https://www.python.org/downloads/) ≥ 3.10  
- [MkDocs](https://www.mkdocs.org/) and [mkdocs-material](https://squidfunk.github.io/mkdocs-material/)  
- GNU Make  

Install dependencies for documentation:

```bash
pip install -r requirements.txt
```

## 🧩 Terraform Modules

### ☁️ AWS Modules

| Module | Description |
|---------|-------------|
| `networking` | Sets up VPCs, subnets, gateways, and security groups |
| `container-app` | Deploys containerized applications on AWS |
| `ecr-repository` | Manages AWS ECR for container images |
| `postgres-deployment` | Provisions PostgreSQL instances on AWS |

---

### 🖥️ On-Prem Modules

| Module | Description |
|---------|-------------|
| `application-on-prem` | On-premise application service deployment |
| `clickhouse-on-prem` | ClickHouse data warehouse setup on-prem |
| `container-app-on-prem` | Local containerized application setup |
| `container-registry-on-prem` | Local container registry configuration |
| `postgres-appdb-on-prem` | Application PostgreSQL database for on-prem environments |
| `postgres-deployment-on-prem` | Core PostgreSQL infrastructure deployment for on-prem setups |