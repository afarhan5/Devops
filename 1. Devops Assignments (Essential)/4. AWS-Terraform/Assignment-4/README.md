## # Terraform Infrastructure as Code (IaC)   [Tool->Grafana]

##  Objective

The objective of this assignment is to design and implement cloud infrastructure using **Terraform** based on a custom architecture diagram. The implementation should follow **Infrastructure as Code (IaC)** best practices, including **remote state management using S3**, **consistent provider versioning**, and modular code structure.

---

##  Phase 1 – Infrastructure Architecture Design

###  Tasks:
- Design a detailed **Infrastructure Architecture Diagram**


![ChatGPT Image Jun 13, 2025, 02_01_23 AM](https://github.com/user-attachments/assets/61f3c982-909b-4609-8d20-5edb78f146ab)


###  Components to Include:
- **VPC** with subnets (Public & Private)
- **Internet Gateway** and **Route Tables**
- **Security Groups** and **NACLs**
- **EC2 Instances**
- **Auto Scaling Groups (ASG)**
- **Application Load Balancer (ALB)**
- **S3**
- **DynamoDB**
  

##  Phase 2 – Terraform-Based Implementation


###  Tasks:

* Write **static Terraform code** to provision resources based on the approved diagram.
* Ensure **modularization** by creating reusable modules for VPC, EC2, ALB, ASG, etc.
* Follow **naming conventions**, **tagging standards**, and **Terraform best practices**.

---

##  Remote Terraform State Management

###  Why Remote State?

* Enables **collaboration**
* Prevents **state conflicts**
* Supports **automation pipelines**

###  Configuration Steps:

* Create an **S3 Bucket** for storing `.tfstate` file.
* Enable **state locking** with **DynamoDB table** (recommended).
* Configure the `backend` block in `backend.tf`:

##  Project Structure


![Screenshot 2025-06-14 021035](https://github.com/user-attachments/assets/5a0dc884-d817-43c8-aa6f-56da838f519e)


## # Deploy

### terraform init

![Screenshot 2025-06-13 054446](https://github.com/user-attachments/assets/17430c8b-5110-42fd-9377-82928799c5cd)


### terraform plan 


![Screenshot 2025-06-13 054505](https://github.com/user-attachments/assets/73eaeef2-e009-482e-972d-a73aed9dc0f2)


### terraform apply


![Screenshot 2025-06-13 054531](https://github.com/user-attachments/assets/751ef864-0289-4a13-ae6c-219021163c9c)

![Screenshot 2025-06-13 054553](https://github.com/user-attachments/assets/57cef248-c6b3-4583-9bc3-66badf5bf9a0)


---

### VPC


![Screenshot 2025-06-14 040703](https://github.com/user-attachments/assets/70cb617d-c5bc-4612-9604-71c35acc042a)



### Instances 



![Screenshot 2025-06-13 040127](https://github.com/user-attachments/assets/8425cac3-56d3-4c8c-a5b8-7a9aa5a8b987)



### S3 bucket 


![Screenshot 2025-06-13 040437](https://github.com/user-attachments/assets/53aacabc-d385-4216-9544-4e4660871c43)



###  DynamoDB 


![Screenshot 2025-06-13 040623](https://github.com/user-attachments/assets/76583a2d-33e4-48ae-b8b8-b4505fe48a5b)



###  Load Balancer


![Screenshot 2025-06-13 041204](https://github.com/user-attachments/assets/ef9c733f-afcb-4ad6-87ff-bd17f58b68b6)



###  Auto Scaling Group 


![Screenshot 2025-06-13 041458](https://github.com/user-attachments/assets/106dc090-ab05-4540-82c3-98468dc6a029)



###  Target Group


![Screenshot 2025-06-13 041532](https://github.com/user-attachments/assets/6de08c73-f524-482d-a87f-1ee8de6d5a7c)

