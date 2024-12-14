# **LoL Pro League Distributed Database (Demo Project)**

This project builds a **distributed PostgreSQL database** using data from the **League of Legends (LoL) Pro League**. It demonstrates the concepts of a distributed database using sharding, and it is intended **for demo purposes only**. High performance and production-level features are **not the goal** of this project.

---

## **Features**
- Utilizes PostgreSQL to create a distributed database architecture.  
- Data is partitioned (sharded) across multiple PostgreSQL instances.  
- Focused on demonstrating distributed database design concepts using LoL Pro League data.

---

## **Requirements**
- PostgreSQL 14 or higher  
- Bash (Unix-like system)  
- Basic knowledge of PostgreSQL and shell scripting  

---

## **Usage**

### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd <your-project-directory>
```

### 2. Set Permissions for Shell Scripts
Ensure all `.sh` scripts in the `scripts` directory are executable:
```bash
chmod +x ./scripts/*.sh
```

### 3. Initialize the PostgreSQL Instances
Run the initialization script to create and start PostgreSQL instances:
```bash
./scripts/init.sh
```

This script will:
1. Set up two PostgreSQL instances on ports **5432** and **5433**.  
2. Initialize databases and apply the schema if available.  

---

## **Notes**
- The project is intended for **demo purposes only**.  
- It does not aim for production-level performance or scalability.  
- Ensure PostgreSQL services are properly installed and configured on your system.  
- If you encounter permission issues, verify that all scripts have executable permissions using `chmod +x`.  

---

## **License**
This project is licensed under the MIT License.

---

## **Disclaimer**
This project is for educational and demonstration purposes only. The data and database architecture are not intended for commercial use.
