# Assignment-1 :-

## Assignment Overview

This assignment demonstrates Jenkins automation for FreeStyle Job. It is divided into two parts:

---

## Part 1: Git Branch Operations via Jenkins Job

###  Features Implemented:
- clone repo
- Create a Git branch
- List all Git branches
- Merge one branch into another
- Rebase one branch onto another
- Delete a branch

###  Job Details:
- **Job Name**: `Git_Branch_Operations(ASSIGNMENT-1)`
- **Trigger**: Manually 
- **Steps**:
  - Create a branch 
  - List all branches 
  - Merge one branch with another branch 
  - Rebase one branch with another branch 
  - Delete a branch 
 
### 
```
#create a git branch	
git checkout -b $branch2
#list all branches
git branch -a
#merge one branch to another
git checkout branch1
git merge $branch2
#rebase
git checkout $branch2
git rebase branch1
#delete
git branch -d $branch2
```


![Screenshot 2025-05-26 024716](https://github.com/user-attachments/assets/aea4c8d8-24f3-4c08-be04-595c68427915)

---

## Part 2: Parameterized File Creation & Publishing

###  Objective:
Use Jenkins to accept user input (`<Ninja Name>`), generate a file, and publish its content via a web server.

---

###  Job 1: Create Ninja File

- **Job Name**: `CreateNinjaFile(ASSIGNMENT-1)`
- **Input**: `Ninja Name` (String Parameter)
- **Task**:
  - Create a file named `ninja.txt`
  - Add content: `"{{ Ninja Name }} from DevOps Ninja"`
  - Send Slack and Email notification (success/failure)

![Screenshot 2025-05-26 024757](https://github.com/user-attachments/assets/a4f6153f-2cee-4846-9fe1-eb7f54f84075)

---

###  Job 2: publish-ninja-file

- **Job Name**: `publish-ninja-filE(ASSIGNMENT-1)`
- **Trigger**: Automatically after successful execution of `CreateNinjaFile(ASSIGNMENT-1)`
- **Task**:
  - Copy the generated file from Job 1
  - Move it to a web server directory 
  - Start the web server
  - Send Slack and Email notification (success/failure)

![Screenshot 2025-05-26 024824](https://github.com/user-attachments/assets/8c4c198e-4aab-46b3-9582-b4a8894dee51)





    
