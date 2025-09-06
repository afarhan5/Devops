# # NGINX Reverse Proxy with High Availability & Disaster Recovery 

##  Objective

The goal of this assignment is to design and implement a scalable setup in AWS that supports:
- Traffic load balancing
- High Availability (HA)
- Disaster Recovery (DR)
- Version upgrades with rollback
- Static hosting using S3
- Automated recovery using Auto Scaling Groups (ASGs)

All operations were performed **within AWS EC2** using AWS CLI without using AWS access/secret keys.

---

##  Day 1 – AMI Versioning, Auto Scaling, Load Testing

###  Tasks Completed:

1. Provisioned Base EC2 Instance
   - Installed NGINX
  
     
2. Created AMI-1 (Stable version)
   - EC2 snapshot taken after installation

3. Launched V1 from AMI-1
   - Made minor NGINX config changes
     
4. Created AMI-2 (Updated version)
   - EC2 snapshot after further changes (V2)

5. Launched V2 from AMI-2

---

###  Auto Scaling Group Configuration

- Launch Template with both AMI versions 
- Configured ASG with:
  - Target Group (attached to ALB)
  - Load Balancer for external traffic routing
  - Health checks on port 80

---

###  Load Test & Scaling Policies Tested

Simulated load using stress tools  stress-ng to trigger ASG scaling.

| Policy Type                 | Result                                                           |
|----------------------------|------------------------------------------------------------------|
| CPU Utilization            | Scaled out when average CPU > threshold              |
| Network In/Out             | Scaled when data transfer exceeded threshold                     |
| ALB Request Count/Target   | Scaled based on number of requests per minute                    |

---
###  NGINX Upgrade and Rollback

- Upgraded from V1 → V2 using ASG update.
- Identified incompatibility in V2.
- Reverted to V1 via ASG rollback using AMI-1.

---

![Screenshot 2025-06-07 200334](https://github.com/user-attachments/assets/d238dab6-5356-47fe-aafa-06fe396e3d8b)


![Screenshot 2025-06-07 200733](https://github.com/user-attachments/assets/532e39fa-5dd6-4355-a8b9-ba07e80f2afd)
![Screenshot 2025-06-07 200826](https://github.com/user-attachments/assets/8e2d1777-c019-4cf1-9582-0a98fb04a550)
![Screenshot 2025-06-07 205819](https://github.com/user-attachments/assets/33e2c9a4-1a95-4863-855f-81288f83da9f)


##  Day 2 – Hosting Website via NGINX + S3 Integration

###  Tasks Completed:

1. Cloned Web Content from Git Repository (VCS)
   - Pulled custom HTML and images using EC2 CLI.

2. Uploaded Web Assets to Amazon S3
   - Used `aws s3 cp` to upload assets.
   

3. Configured NGINX to Host Static Website
   - Used S3 image links in HTML.
   - Served the HTML through NGINX reverse proxy.
  


---

![Screenshot 2025-06-13 050553](https://github.com/user-attachments/assets/b5f9576d-0cf1-4ea9-a696-47edfcca7060)


---

##  Day 3 – ASG Health Check & Recovery Testing

###  Tasks Performed:

1. Manually Made EC2 Instance Unhealthy
   - Stopped NGINX
   - Deleted system files to simulate failure

2. Observed ASG Behavior
   - Detected unhealthy instance via health check
   - Terminated faulty instance
   - Launched new healthy instance automatically

---

##   Concepts Applied
-  AMI Versioning & Rollback Strategy
-  Auto Scaling with CPU, Network, and ALB metrics
-  Load Balancer with Target Group integration
-  Disaster Recovery planning through multi-version strategy
-  Web hosting with S3-backed assets
-  Automated failover and health management via ASG

---

![Screenshot 2025-06-13 044240](https://github.com/user-attachments/assets/2aeea828-4e1a-4a15-a8df-56dd1ecde1b5)


![Screenshot 2025-06-13 044333](https://github.com/user-attachments/assets/d9f4c1e2-02ef-4524-9356-b38c65d3f2f9)


---

