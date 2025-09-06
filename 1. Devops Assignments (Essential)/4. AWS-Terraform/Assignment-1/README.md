#  # Cloud Infrastructure for Spring 3 Hibernate Application

##  Assignment Overview

The goal of this assignment is to design and implement a secure, scalable, and highly available cloud infrastructure for deploying the Spring 3 Hibernate application.
---

##  Infrastructure Components

The architecture is built using the following core components:

| Component         | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| VPC         | Dedicated Virtual Private Cloud to host all infrastructure resources       |
| Public Subnets| Used for internet-facing resources like Load Balancer                      |
| Private Subnets| Host the actual application servers for better security                   |
| Load Balancer (ALB)| Distributes incoming traffic across app servers in private subnets       |
| Auto Scaling Group (ASG) | Automatically scales EC2 instances based on CPU utilization or load |
| EC2 Instances  | Hosts the Spring 3 Hibernate application inside private subnets           |
| Security Group| Manage inbound/outbound access for LB and EC2s                            |
| NAT Gateway  | Allows private instances to access the internet for updates, etc.         |
| Internet Gateway| Provides internet access to the public subnet                           |


---

##  Infrastructure Diagram

> A detailed infrastructure diagram was created to illustrate the complete cloud architecture, including networking layers, security groups, and scaling mechanisms.

![image](https://github.com/user-attachments/assets/40d95fe2-54da-45ee-a231-e0c383201c50)

---

##  Security Considerations

| Layer             | Security Measure                                                  |
|------------------|--------------------------------------------------------------------|
| VPC/Subnets      | Separation of public and private network zones                    |
| Security Groups  | Least privilege rules for ALB and EC2 instances                   |
| NAT Gateway      | Allows secure outbound internet traffic from private instances    |

---

## VPC
-  Dedicated Virtual Private Cloud along with Security Groups and Gateways

![Screenshot 2025-06-04 012941](https://github.com/user-attachments/assets/dde7de6c-1d4d-4abf-a0ee-2b9710bceb9a)

## Instances for Spring3hibernate
 An EC2 for hosting the application


![Screenshot 2025-06-04 013542](https://github.com/user-attachments/assets/99734e3d-89a7-49a4-b302-64067465b93e)


## ALB
 - Multi-AZ deployment for ALB and private subnets ensures high availability.

![Screenshot 2025-06-04 013033](https://github.com/user-attachments/assets/875935bf-6e82-4893-b1ee-f0f4b02cfcd9)

## Deploy ALB
   - Target the EC2 instances
   - Forward traffic on HTTP/HTTPS
     
![Screenshot 2025-06-04 013428](https://github.com/user-attachments/assets/d4bb6cde-6293-4304-aeaf-fb50886d5d6f)


## Target Group
- Where all the traffic would be sent

![Screenshot 2025-06-04 013007](https://github.com/user-attachments/assets/4f0fd55b-556a-4e7d-a7ce-734ae591d6ed)

## AMI
- A snapshot of the instance

![Screenshot 2025-06-04 013117](https://github.com/user-attachments/assets/6d9084c9-eaee-4b60-a625-cb63432d2e44)


## ASG
 - Auto Scaling Group automatically adjusts the number of EC2 instances based on demand.


![Screenshot 2025-06-04 013459](https://github.com/user-attachments/assets/97563cfa-ec2a-4750-8696-81831afa7691)


## Launch Template
- Template used by ASG to launch more instances

![Screenshot 2025-06-04 013133](https://github.com/user-attachments/assets/081a783f-ff53-476c-b687-a443c5c2f489)


##  Accessing the Application

Once deployed, access the app via the ALB DNS:

![Screenshot 2025-06-04 013405](https://github.com/user-attachments/assets/05d9bfa6-d97b-47b1-8cd6-9057461cefd1)

