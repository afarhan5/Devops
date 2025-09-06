# Assignment-5 :-

### Java Project CI Pipeline using Jenkins

## Overview

This project implements a **Declarative Jenkins Pipeline** to automate CI processes for a Java-based project. It includes multiple stages for code checkout, analysis, approval-based artifact publishing, and post-build notifications.

---

## Pipeline Stages

### 1. Code Checkout
- Pulls the latest code from the configured Git repository.

### 2. Parallel Analysis Stages
The following stages run in parallel and can be optionally skipped via pipeline parameters:

#### - Code Stability
- Runs unit tests to verify code stability.
- Tools: JUnit, TestNG, or any preferred testing framework.

#### - Code Quality Analysis
- Analyzes code using tools like SonarQube or Checkstyle.
- Ensures code follows best practices and detects code smells.

#### - Code Coverage Analysis
- Measures test coverage using Jacoco or similar tools.

### 3. Report Generation
- Publishes HTML reports for code quality and test coverage using the `publishHTML` plugin.

### 4. Approval Stage
- Manual input required to approve artifact publishing.
- If no input is provided within 5 minutes, the pipeline times out.

### 5. Artifact Publishing
- Publishes the compiled `.jar` files as build artifacts.

---

## 1 - Stage View:-

![Screenshot 2025-05-26 044526](https://github.com/user-attachments/assets/14c53893-0049-47c5-9539-6d90c88fcf25)

---

## 2 - Skipping Analysis:-

You can control which analysis stages to run using the following Boolean parameters:

- `SKIP_CODE_STABILITY`
- `SKIP_CODE_QUALITY`
- `SKIP_CODE_COVERAGE`



![Screenshot 2025-05-26 045605](https://github.com/user-attachments/assets/bc20460f-a4dc-4dff-ab50-437d8525b32d)



---

## 3 - Notifications:

### A) Slack:-
- Sends build status notifications to a configured Slack channel.


![Screenshot 2025-05-26 044749](https://github.com/user-attachments/assets/95dda0fc-6e6a-424c-a178-2eb888da027f)


---

### B) Email:-
- Sends success or failure notifications to a configured email group.


![Screenshot 2025-05-26 044725](https://github.com/user-attachments/assets/092d21f2-b049-4242-889e-adf559c7428a)


---
## 4 - Pipeline View:-


![Screenshot 2025-05-26 045223](https://github.com/user-attachments/assets/3ff612d7-805a-4f9d-88e6-2529ab566383)


---



## 5 - Console Output:-


![Screenshot 2025-05-26 044812](https://github.com/user-attachments/assets/21517734-1b2a-4f05-8bf0-ed1c20d117cf)


![Screenshot 2025-05-26 045032](https://github.com/user-attachments/assets/2331496d-d0b5-4163-97c8-ecfe2b3bac8f)


![Screenshot 2025-05-26 045120](https://github.com/user-attachments/assets/985e7b74-63ca-43e7-952c-77d8d42cdeb8)


![Screenshot 2025-05-26 045138](https://github.com/user-attachments/assets/44336b22-bf45-4870-a419-e0e4e10d144d)


---
## Requirements

- Jenkins with the following plugins:
  - Git Plugin
  - Slack Notification Plugin
  - Email Extension Plugin
  - HTML Publisher Plugin
- Tools installed on Jenkins agents:
  - Java SDK
  - Gradle/Maven
  - SonarQube Scanner (if used)

---
