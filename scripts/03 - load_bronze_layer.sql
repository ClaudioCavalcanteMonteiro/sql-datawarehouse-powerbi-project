/*
===============================================================================
Load Bronze Layer (Sources -> Bronze)
===============================================================================
Goal:
    -Load data into the 'bronze' schema from CRM and ERP CSV files.
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 

Usage:
    EXEC bronze.load_bronze;
===============================================================================



*/
/* Create or Alter the tables from the source*/
/* DataWarehouse -> programmability*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @full_load_start DATETIME, @full_load_end DATETIME;
	BEGIN TRY /* Catch errors*/
		
		SET @full_load_start = GETDATE();   /*Get full load start time*/

		PRINT '=====================';
		PRINT 'Loading Bronze Layer';
		PRINT '=====================';

		/***  LOAD CRM DATA ***/

		PRINT '--------------------';
		PRINT 'Loading CRM Tables';
		PRINT '--------------------';

		/***********************************/
		/***  bronze.crm_customers_info ***/
		/**********************************/

		SET @start_time = GETDATE();
		PRINT '** Truncating bronze.crm_customers_info';
		TRUNCATE TABLE bronze.crm_customers_info; /*EMPTY TABLE...FULL LOAD*/

		PRINT '** Inserting Data Into bronze.crm_customers_info';
		BULK INSERT bronze.crm_customers_info
		FROM 'D:\Arquivos\Desktop\Projeto DataWarehouse\crm\customers_info.CSV'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK /* BLocks the entie table during operation to acelerate the load*/
			);
		SET @end_time = GETDATE();
		PRINT '** Load Duration: ' + CAST (DATEDIFF(millisecond , @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
		PRINT '---------------------------------------------------------------------------------------------';

		/***********************************/
		/***  bronze.crm_product_info ***/
		/***********************************/

		SET @start_time = GETDATE();
		PRINT '** Truncating bronze.crm_product_info';
		TRUNCATE TABLE bronze.crm_product_info; /*EMPTY TABLE...FULL LOAD*/

		PRINT '** Inserting Data Into bronze.crm_product_info';
		BULK INSERT bronze.crm_product_info
		FROM 'D:\Arquivos\Desktop\Projeto DataWarehouse\crm\product_info.CSV'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK /* BLocks the entie table during operation to acelerate the load*/
			);
		SET @end_time = GETDATE();
		PRINT '** Load Duration: ' + CAST (DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
		PRINT '---------------------------------------------------------------------------------------------';


		/***********************************/
		/***  bronze.crm_sales_info ***/
		/***********************************/

		SET @start_time = GETDATE();
		PRINT '** Truncating bronze.crm_sales_info';
		TRUNCATE TABLE bronze.crm_sales_info; /*EMPTY TABLE...FULL LOAD*/

		PRINT '** Inserting Data Into bronze.crm_sales_info';
		BULK INSERT bronze.crm_sales_info
		FROM 'D:\Arquivos\Desktop\Projeto DataWarehouse\crm\sales_info.CSV'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK /* BLocks the entie table during operation to acelerate the load*/
			);
		SET @end_time = GETDATE();
		PRINT '** Load Duration: ' + CAST (DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
		PRINT '---------------------------------------------------------------------------------------------';

		/***********************************/
		/***  LOAD ERP DATA ***/
		/***********************************/

		PRINT '--------------------';
		PRINT 'Loading ERP Tables';
		PRINT '--------------------';

		/***********************************/
		/***  bronze.erp_cust_az99 ***/
		/***********************************/

		SET @start_time = GETDATE();
		PRINT '** Truncating bronze.erp_cust_az99';
		TRUNCATE TABLE bronze.erp_cust_az99; /*EMPTY TABLE...FULL LOAD*/

		PRINT '** Inserting Data Into bronze.erp_cust_az99';
		BULK INSERT bronze.erp_cust_az99
		FROM 'D:\Arquivos\Desktop\Projeto DataWarehouse\erp\CUSTOMER_AZ99.CSV'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK /* BLocks the entie table during operation to acelerate the load*/
			);
		SET @end_time = GETDATE();
		PRINT '** Load Duration: ' + CAST (DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
		PRINT '---------------------------------------------------------------------------------------------';

		/***********************************/
		/***  bronze.erp_loc_az99 ***/
		/***********************************/
	
		SET @start_time = GETDATE();
		PRINT '** Truncating bronze.erp_loc_az99';
		TRUNCATE TABLE bronze.erp_loc_az99; /*EMPTY TABLE...FULL LOAD*/

		PRINT '** Inserting Data Into bronze.erp_loc_az99';
		BULK INSERT bronze.erp_loc_az99
		FROM 'D:\Arquivos\Desktop\Projeto DataWarehouse\erp\LOCAL_AZ99.CSV'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK /* BLocks the entie table during operation to acelerate the load*/
			);
		SET @end_time = GETDATE();
		PRINT '** Load Duration: ' + CAST (DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
		PRINT '---------------------------------------------------------------------------------------------';


		/***********************************/
		/***  bronze.erp_subcat ***/
		/***********************************/

		SET @start_time = GETDATE();
		PRINT '** Truncating bronze.erp_subcat';
		TRUNCATE TABLE bronze.erp_subcat; /*EMPTY TABLE...FULL LOAD*/

		PRINT '** Inserting Data Into bronze.erp_subcat';
		BULK INSERT bronze.erp_subcat
		FROM 'D:\Arquivos\Desktop\Projeto DataWarehouse\erp\CAT_SUBCAT.CSV'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK /* BLocks the entie table during operation to acelerate the load*/
			);
		SET @end_time = GETDATE();
		PRINT '** Load Duration: ' + CAST (DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' milliseconds';
		PRINT '---------------------------------------------------------------------------------------------';

		/***********************************/
		/***  Full loading time ***/
		/***********************************/

		SET @full_load_end = GETDATE(); /*Get the end time of full loading*/
		PRINT '---------------------------------------------------------------------------------------------';
		PRINT 'Bronze Layer Total Load Time';
		PRINT CAST(DATEDIFF(millisecond, @full_load_start, @full_load_end) AS NVARCHAR) + ' milliseconds';
		PRINT '---------------------------------------------------------------------------------------------';

		/***********************************/
		/***  Error msg ***/
		/***********************************/


		END TRY
		BEGIN CATCH
			PRINT '===================================================';
			PRINT ' ERROR WHILE LOADING BRONZE LAYER ';
			PRINT ' Error:' + ERROR_MESSAGE();
			PRINT ' Error Num:' + CAST (ERROR_NUMBER() AS NVARCHAR);
			PRINT ' Error Num:' + CAST (ERROR_STATE() AS NVARCHAR);
			PRINT '===================================================';
		END CATCH

END
