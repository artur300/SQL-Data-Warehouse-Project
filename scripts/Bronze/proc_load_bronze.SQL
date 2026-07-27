
/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @start_date DATETIME,
		@end_date DATETIME,
		@start_date_batch DATETIME,
		@end_date_batch DATETIME

	BEGIN TRY
	
	    SET @start_date_batch=GETDATE();
		PRINT '=============================================='
		PRINT '           Loading Bronze Layer'
		PRINT '=============================================='

		PRINT '=============================================='
		PRINT '           Loading CRM Tables'
		PRINT '=============================================='

		

		SET @start_date=GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info
		PRINT '>> Inserting Data Into Table: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Artur\Desktop\sql-project\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv' -- <---- File path to the data
		WITH 
			(
				FIRSTROW=2, -- <-- start from second row because first row is the headers
				FIELDTERMINATOR=',', -- <-- the separator (the delimiter)
				TABLOCK -- <-- lock table while loading it improves the run time
			);
		SET @end_date=GETDATE();
		PRINT 'Load Duration: '+CAST(DATEDIFF(SECOND,@start_date,@end_date) AS NVARCHAR) + ' Seconds';
		PRINT '-----------------------------------------------------------------------------------'



		SET @start_date=GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT '>> Inserting Data Into Table: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Artur\Desktop\sql-project\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv' 
		WITH 
			(
				FIRSTROW=2, 
				FIELDTERMINATOR=',', 
				TABLOCK 
			);
        SET @end_date=GETDATE();
		PRINT 'Load Duration: '+CAST(DATEDIFF(SECOND,@start_date,@end_date) AS NVARCHAR) + ' Seconds';
		PRINT '-----------------------------------------------------------------------------------'



		SET @start_date=GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT '>> Inserting Data Into Table: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Artur\Desktop\sql-project\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv' 
		WITH 
			(
				FIRSTROW=2, 
				FIELDTERMINATOR=',', 
				TABLOCK 
			);
		SET @end_date=GETDATE();
		PRINT 'Load Duration: '+CAST(DATEDIFF(SECOND,@start_date,@end_date) AS NVARCHAR) + ' Seconds';
		PRINT '-----------------------------------------------------------------------------------'




		PRINT '=============================================='
		PRINT '           Loading ERP Tables'
		PRINT '=============================================='

		SET @start_date=GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12
		PRINT '>> Inserting Data Into Table: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Artur\Desktop\sql-project\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv' 
		WITH 
			(
				FIRSTROW=2, 
				FIELDTERMINATOR=',', 
				TABLOCK 
			);
		SET @end_date=GETDATE();
		PRINT 'Load Duration: '+CAST(DATEDIFF(SECOND,@start_date,@end_date) AS NVARCHAR) + ' Seconds';
		PRINT '-----------------------------------------------------------------------------------'





		SET @start_date=GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101
		PRINT '>> Inserting Data Into Table: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Artur\Desktop\sql-project\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv' 
		WITH 
			(
				FIRSTROW=2, 
				FIELDTERMINATOR=',', 
				TABLOCK 
			);
        SET @end_date=GETDATE();
		PRINT 'Load Duration: '+CAST(DATEDIFF(SECOND,@start_date,@end_date) AS NVARCHAR) + ' Seconds';
		PRINT '-----------------------------------------------------------------------------------'


		

		SET @start_date=GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		PRINT '>> Inserting Data Into Table: bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Artur\Desktop\sql-project\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv' 
		WITH 
			(
				FIRSTROW=2, 
				FIELDTERMINATOR=',', 
				TABLOCK 
			);
        SET @end_date=GETDATE();
		PRINT 'Load Duration: '+CAST(DATEDIFF(SECOND,@start_date,@end_date) AS NVARCHAR) + ' Seconds';
		PRINT '-----------------------------------------------------------------------------------'

	    SET @end_date_batch=GETDATE();
		PRINT '========================'
		PRINT 'Loading Bronze Layer Is Completed';
		PRINT 'Total Load Duration: '+CAST(DATEDIFF(SECOND,@start_date_batch,@end_date_batch) AS NVARCHAR) + ' Seconds';
		PRINT '========================'


	END TRY

	BEGIN CATCH
	PRINT '========================'
	PRINT 'ERROR OCCURRED WHILE LOADING BRONZE LAYRT'
	PRINT 'error message'+ ERROR_MESSAGE();
	PRINT 'error number'+ CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'error state'+ CAST(ERROR_STATE() AS NVARCHAR);
	PRINT '========================'
	END CATCH
END
