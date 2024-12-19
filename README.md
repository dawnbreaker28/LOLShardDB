# **LoL Pro League Distributed Database (Demo Project)**

This project builds a **distributed PostgreSQL database** using data from the **League of Legends (LoL) Pro League**. It demonstrates the concepts of a distributed database using sharding, and it is intended **for demo purposes only**. High performance and production-level features are **not the goal** of this project.

---

## **Features**
- Utilizes PostgreSQL to create a distributed database architecture.  
- Data is partitioned (sharded) across multiple PostgreSQL instances.  
- Demonstrates distributed database design concepts using LoL Pro League data.  

---

## **Requirements**
- PostgreSQL 14 or higher  
- Bash (Unix-like system)  
- Python 3.8 or higher (for data processing scripts)  
- Basic knowledge of PostgreSQL and shell scripting  

---

## **Setup and Usage**

### 1. **Clone the Repository**
```bash
git clone <your-repo-url>
cd <your-project-directory>
```

---

### 2. **Set Permissions for Shell Scripts**
Ensure all `.sh` scripts in the `scripts` directory are executable:
```bash
chmod +x ./scripts/*.sh
```

---

### 3. **Create Log Directories**
Before initializing the PostgreSQL instances, create the log file directories inside the PostgreSQL data directories:
```bash
mkdir -p $HOME/sql/lol/5432/logs
mkdir -p $HOME/sql/lol/5433/logs
```

---

### 4. **Initialize the PostgreSQL Instances**
Run the initialization script to create and start PostgreSQL instances:
```bash
./scripts/init.sh
```

This script will:
1. Set up two PostgreSQL instances on ports **5432** and **5433**.  
2. Initialize the `lol` databases and apply the schema.  
3. Start logging PostgreSQL output to the corresponding log files.  

---

### 5. **Validate Database Instances**
Once initialization is complete, validate the PostgreSQL instances using the provided validation script:
```bash
./scripts/validate.sh
```

---

### 6. **Import Data into the Database**
To process and import data from `.pkl` files into the database:
1. Navigate to the `src/` directory:
    ```bash
    cd src/
    ```
2. Run the main Python script to import data:
    ```bash
    python main.py
    ```

The `main.py` script will:
- Process and clean the data files.  
- Map the processed data to the correct database schema.  
- Insert the data into the relevant tables.  

Ensure your data files are correctly placed in the `data/` directory.

---

## **Workflow Overview**
1. **Set up PostgreSQL Instances**: Initialize and start two PostgreSQL servers.  
2. **Validate Instances**: Verify the database servers are running correctly.  
3. **Import Data**: Use the Python scripts to process and populate the database with LoL Pro League data.  

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

