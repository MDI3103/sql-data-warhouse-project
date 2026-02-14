/*
Create Database and Schemas
Schema=bronze,silver,gold

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exist.
All data in the database will be permently deleted.Proceed with cautoon and ensure you
have proper backup before running this script
*/



USE master;
GO

--Drop and recreate the DataWarehouse database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  --will alter the database and then set to only single user and then remove any other user
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Datawarehouse;
END;

--Create DataWarehouse DB
CREATE Database DataWarehouse;

USE DataWarehouse;

--Create Schema
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

