# Assignment-3 :-


# Objectives
- Automate the setup of complete infrastructure on AWS using Ansible.
- Build and deploy the [Spring3HibernateApp](https://github.com/opstree/spring3hibernate) Java application.
- Ensure end-to-end provisioning, configuration, and deployment without manual intervention.

---

### Steps Performed

1. **Install MySQL Server**  
Install and configure MySQL database required for the Spring3HibernateApp.

2. **Install Maven**  
Install Maven to build the Java application.

3. **Clone and Build Application**  

Clone the Spring3HibernateApp repository.
## Repository

- [Spring3HibernateApp GitHub Repository](https://github.com/opstree/spring3hibernate)
- [Spring3HibernateApp Website](https://opstree.github.io)

Build the project and generate the `.war` file using Maven.

4. **Install Java JDK 11**  

Install Java Development Kit (JDK) version 11 on the server.

5. **Install Apache Tomcat Server**  

Install and configure Apache Tomcat (version 7.0.108).

6. **Deploy WAR File**

Copy the generated `.war` file to the Tomcat `webapps` directory:

## Execution - 
  ```bash
ansible-playbook -i inventory playbook.yaml
  ```
![Screenshot 2025-04-26 162040](https://github.com/user-attachments/assets/18d1f4eb-a326-45be-997e-ae03f5909f80)







