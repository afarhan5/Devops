# # Assignment-4,5,6 :- 

# OT-MICROSERVICE Kubernetes Pod Deployment Assignment

This guide will help you set up the OT-MICROSERVICE application using Kubernetes pods. It covers how to deploy each component as pods, validate their status, and ensure proper connectivity between services.

---

## Step 1: Attendance Setup

You have **two deployment options** for Attendance and MySQL:

### Option 1: Separate Pods

- **MySQL**: Deploy MySQL in its own pod.
- **Attendance Service**: Deploy the Attendance service in a separate pod.

**Example Kubernetes YAML:**

```yaml
# MySQL Pod
apiVersion: v1
kind: Pod
metadata:
  name: mysql-pod
spec:
  containers:
    - name: mysql
      image: mysql:5.7
      env:
        - name: MYSQL_ROOT_PASSWORD
          value: "password"
      ports:
        - containerPort: 3306
---
# Attendance Pod
apiVersion: v1
kind: Pod
metadata:
  name: attendance-pod
spec:
  containers:
    - name: attendance
      image: yourrepo/attendance:latest
      env:
        - name: DB_HOST
          value: "mysql-pod"
      ports:
        - containerPort: 8080
```

### Option 2: Combined Pod

- **Attendance & MySQL**: Run both Attendance and MySQL containers in a single pod (multi-container pod).

**Example Kubernetes YAML:**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: attendance-mysql-pod
spec:
  containers:
    - name: mysql
      image: mysql:5.7
      env:
        - name: MYSQL_ROOT_PASSWORD
          value: "password"
      ports:
        - containerPort: 3306
    - name: attendance
      image: yourrepo/attendance:latest
      env:
        - name: DB_HOST
          value: "localhost"
      ports:
        - containerPort: 8080
```

### Validation

- Check pod status:
  ```sh
  kubectl get pods
  ```
- Check logs:
  ```sh
  kubectl logs <pod-name> -c <container-name>
  ```
- Test Attendance service connectivity to MySQL.

---

## Step 2: Elasticsearch, Salary, and Employee Pods

### 1. Run Elasticsearch (ES) Pod

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: es-pod
spec:
  containers:
    - name: elasticsearch
      image: docker.elastic.co/elasticsearch/elasticsearch:7.10.1
      env:
        - name: discovery.type
          value: "single-node"
      ports:
        - containerPort: 9200
```

**Validation:**
- Check pod status and logs.
- Access ES with: `curl http://<es-pod-ip>:9200`

### 2. Run Salary Pod

- Connects to ES (set ES_HOST).

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: salary-pod
spec:
  containers:
    - name: salary
      image: yourrepo/salary:latest
      env:
        - name: ES_HOST
          value: "es-pod"
      ports:
        - containerPort: 8081
```

**Validation:**
- Check logs.
- Test Salary service connectivity to ES.

### 3. Run Employee Pod

- Connects to ES (set ES_HOST).

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: employee-pod
spec:
  containers:
    - name: employee
      image: yourrepo/employee:latest
      env:
        - name: ES_HOST
          value: "es-pod"
      ports:
        - containerPort: 8082
```

**Validation:**
- Check logs.
- Test Employee service connectivity to ES.

---

## Step 3: Frontend and Webserver Pods

### 1. Frontend Pod

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: frontend-pod
spec:
  containers:
    - name: frontend
      image: yourrepo/frontend:latest
      ports:
        - containerPort: 3000
```

**Validation:**
- Access the frontend UI at `NodeIP:3000` or via service if exposed.
- Ensure UI loads and interacts with backend services.

### 2. Webserver Pod

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: webserver-pod
spec:
  containers:
    - name: webserver
      image: yourrepo/webserver:latest
      ports:
        - containerPort: 80
```

**Validation:**
- Access webserver at `NodeIP:80` or via service if exposed.
- Ensure proper routing and reverse proxying.

---

## Additional Notes

- **Networking**: Pods in the same Kubernetes cluster can communicate using pod names if they're in the same namespace, or via services.
- **Persistent Storage**: For MySQL and Elasticsearch, use PersistentVolume for data persistence in production.
- **Environment Variables**: Ensure connection details (host, port, credentials) are set correctly in each pod.

---

## Validation Checklist

- [ ] All pods running (`kubectl get pods`)
- [ ] Attendance can connect to MySQL
- [ ] Salary and Employee can connect to ES pod
- [ ] Frontend and Webserver are accessible
- [ ] Application works end-to-end

![Screenshot 2025-06-26 144429](https://github.com/user-attachments/assets/072694ae-8ec1-4d67-8477-dc4eeca15381)


---

**Tip:** Use Services and Deployments for production-grade setups.
