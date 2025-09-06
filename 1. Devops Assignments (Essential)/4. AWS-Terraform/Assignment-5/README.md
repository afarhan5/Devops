# # Terraform: Grafana One-Click Infra Deployment

This project automates the deployment of a complete AWS infrastructure to host Grafana using **Terraform modules**, **S3 for state storage**, and **DynamoDB for state locking**.

---

##  Components

- **VPC** with CIDR block
- **Public & Private Subnets** across 2 AZs
- **Security Groups** (SSH & port 3000 open)
- **Application Load Balancer (ALB)**
- **Auto Scaling Group (ASG)** with EC2 instances
- **IAM roles** (if required)



---

##  Project Structure

![Screenshot 2025-06-14 012602](https://github.com/user-attachments/assets/6b3e6954-bc38-4376-bc70-b05c92bc5287)


---

## # Deploy

## terraform init -reconfigure


![Screenshot 2025-06-14 011735](https://github.com/user-attachments/assets/a02af9dc-6f9e-426a-9dbd-1dc5b3d9df9f)



## terraform plan

![Screenshot 2025-06-14 011835](https://github.com/user-attachments/assets/4eabb2d8-32b0-4e9a-a38c-e91f4c6dc734)



## terraform apply


![Screenshot 2025-06-14 011926](https://github.com/user-attachments/assets/f5090275-e34a-4898-a5fd-a5a24e548200)


---

##  Backend Setup

- **S3 Bucket**: `grafana-tfstate-bucket`



![Screenshot 2025-06-14 020039](https://github.com/user-attachments/assets/25685fc8-4b18-4e7b-bc2a-6022fa5a655b)


- **DynamoDB Table**: `terraform-lock`



![Screenshot 2025-06-14 015942](https://github.com/user-attachments/assets/be7eed6c-af4b-479e-ab3c-cacde17bae2e)



- IAM Policy attached to allow `s3` and `dynamodb` access

![Screenshot 2025-06-14 015049](https://github.com/user-attachments/assets/ca16698a-0585-4eee-900e-f7e33f65af40)


---

### VPC


![Screenshot 2025-06-14 040703](https://github.com/user-attachments/assets/70cb617d-c5bc-4612-9604-71c35acc042a)



### Instances 



![Screenshot 2025-06-13 040127](https://github.com/user-attachments/assets/8425cac3-56d3-4c8c-a5b8-7a9aa5a8b987)


###  Load Balancer


![Screenshot 2025-06-13 041204](https://github.com/user-attachments/assets/ef9c733f-afcb-4ad6-87ff-bd17f58b68b6)



###  Auto Scaling Group 


![Screenshot 2025-06-13 041458](https://github.com/user-attachments/assets/106dc090-ab05-4540-82c3-98468dc6a029)



###  Target Group


![Screenshot 2025-06-13 041532](https://github.com/user-attachments/assets/6de08c73-f524-482d-a87f-1ee8de6d5a7c)







 
