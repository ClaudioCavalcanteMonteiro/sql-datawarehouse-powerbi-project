/*
=============================================================
Create Database and Schemas
=============================================================

Goal:
    Create a new database named "DataWarehouse" and verify whether it already exists.
    If the database exists, it will be dropped and recreated.

    After that, the script creates three schemas based on the Medallion
    Architecture:
        - bronze
        - silver
        - gold

TAKE CARE:
    Running this script will permanently delete the existing "DataWarehouse"
    database and all stored data.

    PAY ATTENTION!!!

*/


-- Calls the master database
USE master; 
GO

-- Check if 'DataWarehouse' exists, drop and recreate
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
