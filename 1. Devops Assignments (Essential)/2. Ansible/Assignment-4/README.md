# Assignment-4 :-

# System Manager - Ansible Role

Manage and automate core system configurations like software installation, user management, repository management, and folder structure setup using Ansible.


# Introduction

The **System Manager** Ansible role aims to automate critical administrative tasks required for initializing and maintaining virtual machines across different environments, ensuring consistency and reducing manual workload.

---

# Features

### Software Management
Install and configure required packages using the `system-manager` role.
- Install and manage required software packages.
```yaml
system_software:
  - git
  - vim
  - curl
```

# User Management
- Create, manage, and configure system users and their permissions.

# Git Repository Management
- Clone and update multiple Git repositories onto the VM.

# Directory Structure Setup
- Create necessary folders with defined ownership and permissions.

# System-Specific Configurations
- Configure environment variables, SSH keys, cron jobs, and basic security settings.

#  Role Structure
```bash
tree
```
![Screenshot 2025-04-27 234536](https://github.com/user-attachments/assets/d2f4c5b0-5e37-4c51-ba59-de63181af236)


# Execution
```bash
ansible-playbook -i inventory playbook.yml
```

![Screenshot 2025-04-27 235706](https://github.com/user-attachments/assets/f6f7b0c8-19f2-4619-ae0e-c3daeda9d217)

