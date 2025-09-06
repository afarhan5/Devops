
#  # Assignment-1 :- Docker Website & User-based Directory Permissions

##  Objective

This assignment focuses on two key tasks:

- Hosting a **time-based dynamic static website** using Docker and domain-style access.
- Creating a **user-specific directory structure** inside a Docker container with controlled permissions.

---

##  Part 1: Static Website Hosting via Docker with Time-based Response

###  Goal

Build a utility using Docker to:

- Host a static website accessible via a **custom domain** format like `<name>.<team>.com`
- Make the website **available only in two time intervals**:
  - **10 AM - 12 PM**
  - **4 PM - 6 PM**
- Return **different greetings** based on the time:
  - **Morning (10-12):** "Hello from Mohan"
  - **Evening (4-6):** "Hello from Pankaj"

###  Implementation Overview

- Create an NGINX-based Docker image.
- Use a shell script or cron to manage time-based responses.
- Use environment variables or volume mounts for dynamic content updates.

###  Sample Project Structure

```bash
docker-static-site/
├── Dockerfile
├── index.html (dynamic via script)
├── entrypoint.sh
└── nginx.conf
````

###  Access Format

```text
http://mohan.ntd.com (configured in local DNS or `/etc/hosts`)
```

###  Sample `curl` Output

```bash
$ curl http://mohan.ntd.com
# Output during 10-12: Hello from Mohan
# Output during 4-6 : Hello from Pankaj
# Outside window    : Service Unavailable
```


## 📘 Notes

* Update your `/etc/hosts` for custom domain resolution (or use DNS).
* Ensure Docker has access to local volumes if you want persistent data.
* Use cron or scripting for live switching of content in Part 1.
* Use ACLs or POSIX permissions to enforce strict user-based access.
  
-----------------------------------------------------------------------------------------------------------------------------------------------------------
PART-1 SCREENSHOTS
-----------------------------------------------------------------------------------------------------------------------------------------------------------

![Screenshot 2025-06-06 052441](https://github.com/user-attachments/assets/b6ef86a7-8c95-4382-a23b-96c63d20b22b)



![Screenshot 2025-06-06 024818](https://github.com/user-attachments/assets/4ed2455d-1159-4ac5-bda8-9b58ff8d5bba)


![Screenshot 2025-06-06 052541](https://github.com/user-attachments/assets/e9cb820c-7502-49c6-8b6e-b0af3e826fde)



---------------------------------------------------------------------------------------------------------
---

##  Part 2: Container with Role-Based Directory Access

###  Goal

Create a Docker container that includes a directory structure with **user-specific write permissions**:

###  Directory Structure

```bash
Data/
└── Ninjas/
    ├── Mohan/
    ├── Uma/
    ├── Shikha/
    └── Mayank/
```

###  Permission Policy

* The **user (e.g., Mohan)** inside the container should:

  * **Write** only to `/Data/Ninjas/Mohan`
  * Have **read-only access** to all other directories

###  Implementation Steps

1. Use Docker to create a Linux container (e.g., Ubuntu).
2. Create users using `useradd` and set permissions using `chown`, `chmod`, and `setfacl`.
3. Use volumes if you want persistent data or reuse on host.

###  Sample Commands

```bash
# Create users
useradd mohan
mkdir -p /Data/Ninjas/{Mohan,Uma,Shikha,Mayank}

# Assign ownership
chown mohan:mohan /Data/Ninjas/Mohan

# Set read-only for others
chmod 755 /Data/Ninjas/*
setfacl -m u:mohan:r /Data/Ninjas/Uma
setfacl -m u:mohan:r /Data/Ninjas/Shikha
```

---




##  Expected Behavior

| User  | Can Write To    | Can Read From         |
| ----- | --------------- | --------------------- |
| Mohan | Mohan Directory | Uma, Shikha, Mayank   |
| Uma   | Uma Directory   | Mohan, Shikha, Mayank |
| ...   | ...             | ...                   |

---

##  Testing

Use the following commands within the container:

```bash
# As user 'mohan'
touch /Data/Ninjas/Mohan/test.txt       
touch /Data/Ninjas/Uma/test.txt         
cat /Data/Ninjas/Uma/index.txt         
```

-----------------------------------------------------------------------------------------------------------------------------------------------------------
PART-2 SCREENSHOTS
-----------------------------------------------------------------------------------------------------------------------------------------------------------

![Screenshot 2025-06-06 061946](https://github.com/user-attachments/assets/d68cd081-922e-4143-b48e-f19cd21aebc5)




