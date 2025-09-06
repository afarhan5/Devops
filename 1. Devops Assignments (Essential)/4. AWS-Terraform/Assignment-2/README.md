#  # Deployment Strategies with Amazon S3 Integration

##  Objective

This assignment focuses on understanding and implementing two core **deployment strategies** — **Recreate** and **Rolling** — while integrating **Amazon S3** for storing and serving static assets and deployment artifacts.

---

# Comparison table - summarizing the AWS Deployment Strategies, including their **descriptions**, **advantages**, and **disadvantages**:

| **Strategy**   | **Description**                                                                | **Advantages**                                                             | **Disadvantages**                                                                     |
| -------------- | ------------------------------------------------------------------------------ | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **Recreate**   | Stops old version entirely, then starts new one. Causes downtime.              | - Simple<br>- No version overlap                                           | - Full downtime<br>- Slow rollback<br>- High risk if deployment fails                 |
| **Rolling**    | Gradually replaces old instances with new ones.                                | - Minimal/no downtime<br>- Safer rollout<br>- Supports continuous delivery | - Temporary capacity reduction<br>- More complex<br>- No version isolation            |
| **Blue-Green** | Two environments: Blue (current), Green (new). Switch traffic after testing.   | - Near-zero downtime<br>- Easy rollback<br>- Safe testing environment      | - High cost (duplicate environments)<br>- Complex setup<br>- Database sync challenges |
| **A/B**        | Deploys multiple versions to different user groups for testing and comparison. | - Data-driven decisions<br>- Reduces risk<br>- Optimizes UX                | - Risk of inaccurate results<br>- Operational complexity<br>- May impact performance  |
| **Canary**     | Gradual rollout to a small user group first, expanding if stable.              | - Low risk<br>- Fast feedback<br>- Improves stability and UX               | - Needs strong monitoring<br>- Automation required<br>- Moderate complexity           |


##  Deployment Strategies Implemented

###  Recreate Deployment

| Step                             | Description                                                                 |
|----------------------------------|-----------------------------------------------------------------------------|
| **EC2 Setup**                    | Launch a single EC2 instance                                |
| **AMI Creation**                 | Create a snapshot (AMI) after configuring the application                   |
| **Deployment**                   | Use the AMI to manually recreate and launch the app environment             |
| **S3 Integration**               | Store and serve static assets ( images ) from an Amazon S3 bucket    |


# **Instance**

![Screenshot 2025-06-05 010921](https://github.com/user-attachments/assets/5945bf7f-6525-4e98-9979-43179efd21db)


## **AMI**

![Screenshot 2025-06-05 011117](https://github.com/user-attachments/assets/07ecddd0-8e1a-4fbe-a7d7-45bf9803a222)


## **S3 Bucket**

![Screenshot 2025-06-05 011300](https://github.com/user-attachments/assets/e8311406-be2b-452a-963f-77edd654364c)


## **Application Deployed**

![Screenshot 2025-06-05 010952](https://github.com/user-attachments/assets/921fa6cc-85c3-4cf2-adc9-29667b89287f)

---

###  Rolling Deployment

| Step                             | Description                                                                 |
|----------------------------------|-----------------------------------------------------------------------------|
| **Auto Scaling Group Setup**     | Launch an ASG with desired min/max instance count                           |
| **Launch Configuration**         | Define an LC with application version 1                                     |
| **Initial Deployment**           | Deploy app using initial launch config and verify setup                     |
| **Rolling Update**               | Create a new LC with app version 2 and update the ASG                       |
| **S3 for Artifacts**             | Store build artifacts  in S3 for versioned deployments |


## **Instance**

![Screenshot 2025-06-05 010921](https://github.com/user-attachments/assets/5945bf7f-6525-4e98-9979-43179efd21db)


## **AMIs**

![Screenshot 2025-06-05 011117](https://github.com/user-attachments/assets/07ecddd0-8e1a-4fbe-a7d7-45bf9803a222)

## **ALB**

![Screenshot 2025-06-05 011132](https://github.com/user-attachments/assets/efc00c91-c43e-48cb-bbf4-5171af5e00ba)


## **Target Group**

![Screenshot 2025-06-05 011147](https://github.com/user-attachments/assets/4d02e4a8-6d1d-470f-b58b-cf7659fbedef)


## **ASG**

![Screenshot 2025-06-05 010900](https://github.com/user-attachments/assets/1a46242f-4ac9-40a9-96bb-18b14bb561a1)


## **Application Deployed V1**

![Screenshot 2025-06-05 010952](https://github.com/user-attachments/assets/463e30aa-7346-4fad-bdbf-b9817b886def)


## **Application Deployed V2**

![Screenshot 2025-06-05 011015](https://github.com/user-attachments/assets/c02926df-21e3-477b-90ec-12168116bc7d)
