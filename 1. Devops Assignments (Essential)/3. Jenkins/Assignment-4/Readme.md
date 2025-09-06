# Assignment-4 :- 

### Jenkins Node Configuration & Load Distribution

## Topics Covered

- Configuring Jenkins Agents (Nodes)
- Distributing Job Load across Nodes
- Setting Executors per Node
- Assigning Specific Jobs to Nodes
- Conditional Job Execution Based on Time

---

##  Objective

The goal of this assignment is to create and configure **three different Jenkins nodes (Ubuntu, RHEL, and CentOS)**, manage load distribution via **executors**, and assign **specific jobs** to the corresponding nodes with **conditional scheduling**.

---

##  Node Configurations

###  1. Ubuntu Node (via Command on Master)

- **Connection Method:** Execution of a command on the master
- **Maximum Executors:** 5
- **Assigned Job:** `Assignment 1: Part 1`
- **Label:** `ubuntu-node`
- **Usage:** Restrict jobs exclusively tied to this label

---

![Screenshot 2025-05-26 050916](https://github.com/user-attachments/assets/df9821fa-9a35-4864-b99b-0de5b875f1c8)


###  2. RHEL Node (via SSH)

- **Connection Method:** Launch slave agents via SSH
- **Maximum Executors:** 2
- **Assigned Job:** `Assignment 1: Part 2`
- **Label:** `rhel-node`
- **Usage:** Restrict jobs exclusively tied to this label

---

![Screenshot 2025-05-26 050948](https://github.com/user-attachments/assets/3994fa3f-d747-40a7-8b8d-569e4fdb94d8)


### 3. CentOS Node (via SSH)

- **Connection Method:** Launch slave agents via SSH
- **Maximum Executors:** 3
- **Assigned Job:** `Assignment 3`
- **Label:** `centos-node`
- **Special Condition:**  
  - Between **9 AM and 6 PM** → Jobs **must run on CentOS Node**
  - Outside this range → Jobs **should fallback to Master node**
- **Implementation Suggestion:** Use Jenkins pipeline with `when` or `node` + `if` condition for time-based logic.

---

![Screenshot 2025-05-26 051016](https://github.com/user-attachments/assets/4e3c6501-884b-4758-b4be-f5e3ca9afd92)


##  Setup Instructions

###  Step-by-step for All Nodes

1. **Manage Jenkins > Manage Nodes > New Node**
2. **Add Node Details:**
   - Name: `ubuntu-node`, `rhel-node`, or `centos-node`
   - Type: Permanent Agent
   - Remote root directory: e.g. `/home/jenkins-agent`
   - Labels: Unique per node 
   - Usage: “Only build jobs with label expressions matching this node”

3. **Connection Methods:**
   - **Ubuntu Node:** Use “Launch agent by connecting it to the master”  
     - Enter command that agent should run on master
   - **RHEL/CentOS:** Use “Launch agents via SSH”
     - Provide SSH credentials and host
     - Ensure Jenkins master has SSH access

4. **Set # of Executors:** As per node’s requirement

---


##  Time-Based Execution (CentOS Node)

For `Assignment 3`, use the following strategy in Jenkins Pipeline:

```groovy
def currentHour = new Date().format('HH', TimeZone.getTimeZone('Asia/Kolkata')) as int

if (currentHour >= 9 && currentHour <= 18) {
    node('centos-node') {
        // Job steps
    }
} else {
    node('master') {
        // Job steps
    }
}

