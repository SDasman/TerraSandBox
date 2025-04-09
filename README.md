# TerraSandBox: Terraform EKS Web App Deployment
This is a testing repo for Terraform Deployments of AWS Infrastructure mainly with Kubernetes.

## Overview

This project uses **Terraform** to deploy a complete **AWS EKS** environment with the following infrastructure components:

- A dedicated **VPC** and two public **subnets**
- An **EKS (Elastic Kubernetes Service)** cluster
- A managed EC2 **worker node** group for running containers
- A simple **web app container** (Nginx demo) running inside EKS
- A **Load Balancer** to expose the container's web interface to the internet

Each environment is uniquely identified by the `env` variable, allowing you to run the script multiple times in the same region for different environments (e.g., `dev`, `staging`, `prod`).

---

## Project Structure

- `providers.tf`: Specifies the AWS provider and region
- `variables.tf`: Defines input variables like region, key name, and environment
- `networking.tf`: Contains the VPC, subnets, and security group resources
- `eks.tf`: Provisions the EKS cluster, worker nodes, and Kubernetes manifests
- `outputs.tf`: (Optional) Outputs useful data like EKS cluster endpoint or load balancer DNS

---

## What the Terraform Files Do

### `networking.tf`
- Creates a new VPC and two public subnets
- Configures security groups as needed
- Sets up internet access and required tags for EKS

### `eks.tf`
- Uses the AWS EKS module to create an EKS cluster
- Attaches EC2 worker nodes as part of a node group
- Deploys an Nginx-based demo container
- Sets up a Kubernetes `Service` of type `LoadBalancer` to expose the app

---

## Requirements

- Terraform **v1.3.3**
- AWS CLI configured with proper credentials
- A key pair in your AWS account (`ec2_key_name`)
- kubectl and aws-iam-authenticator for EKS management (optional)

---

## Usage

1. Clone the repository:
   ```bash
     git clone https://github.com/your-repo/TerraSandBox.git
     cd TerraSandBox
   ```

2. Create a `terraform.tfvars` file:
   ```hcl
   env          = "dev"
   aws_region   = "us-east-1"
   ec2_key_name = "your-key-pair-name"
   ```

3. Initialize, validate, and apply Terraform:
   ```bash
   terraform init
   terraform validate
   terraform apply
   ```

4. After the cluster is ready, configure `kubectl` to connect to EKS:
   ```bash
   aws eks update-kubeconfig --region us-east-1 --name eks-cluster-dev
   kubectl get svc
   ```

---

## What is AWS?

**Amazon Web Services (AWS)** is the leading cloud provider offering services like virtual machines (EC2), databases (RDS), and container orchestration (EKS). It enables organizations to build scalable infrastructure on-demand.

---

## What is Infrastructure as Code (IaC)?

**IaC** is the practice of provisioning and managing infrastructure using code rather than manual processes. Tools like Terraform allow teams to version control, automate, and reproduce infrastructure reliably.

---

## What is DevOps?

**DevOps** is a set of practices that combines software development (Dev) and IT operations (Ops). It emphasizes automation, continuous delivery, and rapid iteration to improve software quality and deployment speed. IaC is instrumental in DevOps since replication, disaster recovery, redudancy and scalability are all needed to have a healthy adaptive IT infrastructure.
