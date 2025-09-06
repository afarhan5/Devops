# Linux Assignment-2

- This repository contains Bash script utilities created for Linux command practice assignments:

# UserManager.sh
- A utility script to manage simulated users and teams.

# Features
- Add/Delete teams (simulated groups)
- Add/Delete users under teams
- Set permissions for user home directories
- Create shared directories: team and ninja
- Change user shell and password

# Usage Examples
List all users or teams
- ./UserManager.sh addTeam devs
- ./UserManager.sh addUser Alice devs
- ./UserManager.sh changeShell Alice /bin/bash
- ./UserManager.sh ls User
