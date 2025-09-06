# Assignment-5 :-

#  Ansible Role: Grafana Setup

This Ansible role installs and configures **Grafana** in a version-specific and OS-independent way. It supports both **CentOS** and **Ubuntu** systems and follows best practices including variable management, Jinja templating, and role modularization with handlers.


# Features

- Installs **Grafana** of a specific version (controlled by variable)
- Compatible with **both Ubuntu and CentOS**
- Uses **Jinja2 templates** for dynamic configuration
- All configurations are **fully variable-driven**
- Includes **handlers** (defined separately from tasks)
- Can be executed on:
  - Ubuntu only
  - CentOS only
  - Both simultaneously

---


# <br> Role Directory Structure

```bash
tree
```

![Screenshot 2025-05-02 210306](https://github.com/user-attachments/assets/6113a55b-30f8-461d-89ea-03b414df14d0)


# How to Run

Run the playbook using the following command:

```bash
ansible-playbook -i inventory playbook.yml
```

![Screenshot 2025-05-02 205401](https://github.com/user-attachments/assets/2c22e014-262c-4162-9240-575ce5255c29)



# <br> Grafana Service Status - 
```bash
sudo systemctl status grafana-server
```

![Screenshot 2025-05-03 011136](https://github.com/user-attachments/assets/1e66a8fc-40f1-4c7a-9737-bf44f245725b)



# <br> Grafana Web Interface - 
```bash
public_ip:3000
```

![Screenshot 2025-05-03 014750](https://github.com/user-attachments/assets/a77b07aa-f0a5-4289-ac2b-9d551ae42ad8)






