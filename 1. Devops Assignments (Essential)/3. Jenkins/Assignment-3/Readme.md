# Assignment-3 :-

### Jenkins CI Pipeline – Multi-Language Repositories

##  Assignment Overview

This assignment contain FreeStyle & sets up CI pipelines for *three different repositories* (Python, GoLang, and Java) using *Jenkins Freestyle Jobs*. Each job performs comprehensive CI checks and manages artifacts and notifications.

---

##  Repositories Used

| Language | Repository URL                                                                 |
|----------|---------------------------------------------------------------------------------|
| Python   | [attendance-api](https://github.com/OT-MICROSERVICES/attendance-api)           |
| GoLang   | [employee-api](https://github.com/OT-MICROSERVICES/employee-api)               |
| Java     | [spring3hibernate](https://github.com/opstree/spring3hibernate.git)            |

---

##  Jenkins Freestyle Jobs

Separate Freestyle jobs were created for each repo:

1. Python
2. GoLang
3. Java(spring3hibernate) 

Each job performs a series of generic and advanced CI checks.

---

##  CI Checks Implemented

| CI Check               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
|  Code Checkout        | Clones the repository from GitHub using SCM plugin                          |
|  Unit Testing         | Runs language-specific test suites (e.g. pytest, go test, mvn test)   |
|  Code Coverage        | Generates coverage reports and stores them in Jenkins                       |
|  Dependency Scanning  | Identifies vulnerable/outdated dependencies                                 |
|  Credential Scanning  | Detects secrets/tokens in source code using tools like gitleaks or truffleHog |
|  Artifact Management  | Stores build artifacts locally or remotely        |
|  Report Archival      | Archives HTML, XML, or JUnit reports for visibility                         |
|  Notification System  | Sends notifications on CI failure via Email/Slack/Telegram                  |

---

##  Artifacts & Reports

| Job                | Artifacts Stored                     | Report Types             |
|--------------------|---------------------------------------|--------------------------|
| Python  | .tar.gz of Python app, coverage.txt | Pytest, Coverage         |
| GoLang   | Compiled binary, go-coverage.out      | Go test reports          |
| Java(spring3hibernate)| JAR file, surefire-reports            | JUnit, JaCoCo (coverage) |

All artifacts and reports are archived in Jenkins using the *Archive the Artifacts* post-build action.

---

##  Notification Setup

- Slack: Configured using Slack Notification Plugin
- Email: Configured with SMTP server and project recipients list
- Trigger: Notifications are sent only on failure

---


# Python

![Screenshot 2025-05-26 052911](https://github.com/user-attachments/assets/f210f728-30bd-4e58-844c-d9a4405a2920)

---
# GoLang

![Screenshot 2025-05-26 052942](https://github.com/user-attachments/assets/19ad9f80-075a-46b8-bbf1-46c6bd0abb4c)


---
# Java 

![Screenshot 2025-05-26 053013](https://github.com/user-attachments/assets/7219c828-f155-4a87-8f31-b6b845d41c9d)


---



