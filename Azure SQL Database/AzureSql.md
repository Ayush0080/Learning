# Azure SQL Database

### Creating Azure SQL Database :



- SQL Server Deployment Option on Azure
  1. Azure SQL Virtual Machines (IaaS)
    -  This option involves running a traditional SQL Server instance on a virtual machine (VM) in Azure. You have full administrative control over the SQL Server instance and the underlying operating system.

  2. Azure SQL Database (PaaS)
     -  This is a fully managed, intelligent, and scalable relational database service. Microsoft handles the underlying infrastructure, including OS patching, backups, and high availability.

  3. Azure SQL Managed Instance (PaaS)
    - This is a middle ground between the full control of a VM and the full management of a single database. It's designed to provide near-complete compatibility with the latest on-premises SQL Server database engine.


  - go to the azure portal and search resource Azure SQL
     
    ![alt text](image.png)
    ![alt text](image-1.png)
    ![alt text](image-2.png)
    ![alt text](image-3.png)



- firewall setting : it is a way of controlling who can  be allowed network access to your online resource on Azure.

    - no go to the SQL server > Security > Networking > Firewall rules and add my client ip address access and Allow Azure services and resources to access this server 

    ![alt text](image-4.png)


### Accessing Azure SQL Databse : 

#### Accessing Azure SQL Databse within Azure Portal
![alt text](image-5.png)
![alt text](image-6.png)
![alt text](image-7.png)
![alt text](image-8.png)

#### Accessing Azure SQL Databse SQL server management Studio
![alt text](image-9.png)
![alt text](image-10.png)
![alt text](image-11.png)

#### Accessing Azure SQL Databse from Azure Data Studio 
 ![alt text](image-12.png)
 ![alt text](image-13.png)


 ### Managing Azure SQL Database server 
 
#### creating SQL USers for an Azure SQL Database

 ##### creating SQL USers for an Azure SQL Database in SSMS


  ``` bash
   -- create SQL login in master database
   -- make sure you have switched context to the master database
      CREATE LOGIN testLogin1
      WITH PASSWORD = 'StrongPasswordGoesHere';
   -- add database user for login testLogin1
   -- make sure you have switched context to the user database
      CREATE USER [testLogin1]
      FROM LOGIN [testLogin1]
      WITH DEFAULT_SCHEMA=dbo;
   -- add user to database role(s) (i.e. db_owner)
      -ALTER ROLE db_owner ADD MEMBER [testLogin1];
  ```    
- created login in master 
![alt text](image-23.png)

- add database user for login 
  ![alt text](image-24.png)

- add user to database role
  ![alt text](image-25.png)  

- try to loging with user in db and specify db 
  ![alt text](image-26.png)  
  ![alt text](image-27.png)
  ![alt text](image-28.png)


### Managing Azure SQL Database
    
- Geo - Replication : 
   -  high-avilibilty feature on zure SQL
   - on Azure SQL database server Failver groups , you group together many databse (only one copy in a different region)
   - on Azure SQL Database Geo-replication , you create high-avilibilty for single databse(up to 4 secondaries)

- Azure Synapse Link  is a feature that provides a seamless, "no-ETL" (Extract, Transform, Load) connection between Azure Synapse Analytics and other operational data stores, such as Azure Cosmos DB, Azure SQL Database, and Microsoft Dataverse. It's designed for near real-time analytics and reporting, as it allows you to query your operational data with minimal impact on the performance of your transactional workloads  


- Data Discovery & Classification : security feature in SQL databases that helps you identify, label, and report sensitive data. This process is crucial for enhancing your organization's data security, meeting regulatory compliance standards (like GDPR or HIPAA), and managing data privacy.

![alt text](image-36.png)
![alt text](image-35.png)
  

- Dynamic Data Masking : Dynamic Data Masking (DDM) is a security feature that hides sensitive data from non-privileged users without altering the data in the database itself. Instead of permanently changing the data, it applies a masking layer on top of the query results. This allows developers or other authorized personnel to work with a production database for tasks like troubleshooting, without being exposed to sensitive information.

![alt text](image-37.png)  
![alt text](image-38.png)  

- monitoring 
   - check of cpu usage in sql databse using cpu utilization metricks 
     ![alt text](image-39.png)
  - Diagnostic settings in SQL database (specifically in Azure SQL Database) are a feature of Azure Monitor that allows you to collect and export platform logs and metrics from your database to various destinations for monitoring, analysis, and archiving



### Creating and Accessing an Azure SQL server Virtual machine


  #### create a SQL virtual machines
  - created vm using windows images 
  ![alt text](image-48.png)
  ![alt text](image-49.png)
  - disk used HDD
  ![alt text](image-50.png)
  - networking allowed public inbound port fro rdp
  ![alt text](image-51.png)
  - for SQL server setting allow sql connectivity on public port 6000
  ![alt text](image-55.png)

  - connect SQL vm using ssms
    ![alt text](image-53.png)
    ![alt text](image-54.png)
    ![alt text](image-56.png)

  - connect SQL vm using Azure data studio
  ![alt text](image-57.png)  


  - now we are loggined into SQL vm now create Database
  ![alt text](image-58.png)
  ![alt text](image-59.png)


#### Enable Stretch Database in SQL server :  
- Stretch Database : SQL server feature for keeping active data on-permises and historical data on Azure cloud storage 

  - right click on databse and go to the task and select Stretch

   ![alt text](image-60.png)
   ![alt text](image-61.png)

   - here is show tables are eligible to be used for Stretch.
     ![alt text](image-62.png)

   - asking for account and azure server  
     ![alt text](image-63.png)
     ![alt text](image-64.png)


     


  
   









 

     
    

