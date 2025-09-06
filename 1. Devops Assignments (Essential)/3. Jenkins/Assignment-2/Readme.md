# Assignment–2 :- 

### User Authentication & Authorization

## Assignment Overview

This assignment covers user authentication and authorization using Jenkins. It is divided into two parts:

- **Part 1**: Role-Based Access Control (RBAC) using the Role-Based Authorization Strategy plugin.
- **Part 2**: Enabling Single Sign-On (SSO) for Admin using Google OAuth.

---

##  Part 1: Role-Based Access Control (RBAC)

###  Team Structure & Permissions


![Screenshot 2025-05-26 042930](https://github.com/user-attachments/assets/892a74d9-87b0-4500-8d13-aeb7ad1d2f5f)

---

###  Jenkins Jobs Created

A total of **9 dummy jobs** were created, each printing its job name and build number:

- **Developer View**
  - `dev-1`
  - `dev-2`
  - `dev-3`
 
- **DevOps View**
  - `devops-1`
  - `devops-2`
  - `devops-3`

- **Testing View**
  - `test-1`
  - `test-2`
  - `test-3`


  ![Screenshot 2025-05-26 031920](https://github.com/user-attachments/assets/d0f4f429-b87a-4a5b-80b8-ac0625df33f1)


---

###  Users & Roles

| Role     | Users          |
|----------|----------------|
| Developer | `developer-1`, `developer-2` |
| Testing   | `testing-1`, `testing-2`     |
| DevOps    | `devops-1`, `devops-2`       |
| Admin     | `admin-1`                    |


![Screenshot 2025-05-26 031833](https://github.com/user-attachments/assets/c2f5ed86-9a4d-4914-a601-a01af99e9a55)



![Screenshot 2025-05-26 042930](https://github.com/user-attachments/assets/bb5f7921-01f2-445f-a990-adca66cc9f0a)

---

###  Authorization Strategy Used

- **Strategy**: **Role-Based Authorization Strategy**
- **Plugin**: `Role-based Authorization Strategy Plugin`
- **Implementation**:
  - Created global roles: `developer`, `tester`, `devops`, `admin`
  - Assigned job-specific permissions to roles
  - Mapped users to respective roles
  - Created views using **Nested View Plugin** for clean separation

    

---

![Screenshot 2025-05-26 032331](https://github.com/user-attachments/assets/3c0bd52f-4bc6-417a-8841-4d603fa81717)


![Screenshot 2025-05-26 032359](https://github.com/user-attachments/assets/68a8ea6b-2ea8-4a9e-8361-c094e3d9f67f)



##  Part 2: SSO with Google for Admin

###  Features

- Google Single Sign-On (SSO) integration for admin access
- OAuth credentials configured via Google Developer Console
- Restricted to `admin-1` using Google login

---

###  Configuration Steps

1. **Google OAuth Setup**:
   - Created project in Google Developer Console
   - Enabled **Google+ API**
   - Created **OAuth 2.0 credentials**
   - Whitelisted redirect URI from Jenkins

2. **Jenkins Setup**:
   - Installed `Google Login Plugin`
   - Configured `client ID` and `client secret`
   - Enabled security: Google SSO + Role-Based Strategy
   - Mapped `admin-1` to `admin` role upon login

---


![Screenshot 2025-05-26 043401](https://github.com/user-attachments/assets/d1ee5443-09f9-489b-aaf6-4a8b1c93eda9)


![Screenshot 2025-05-26 043426](https://github.com/user-attachments/assets/7ad479e9-ddeb-4e0a-8b73-ac1f2a7e7c1c)


---

##  Tools & Plugins Used

- Jenkins
- Role-based Authorization Strategy Plugin
- Google Login Plugin





