-- LOADING DATA FROM CSV FILE USING BULK INSERT and also truncate making sure table is empty before inserting that way data is not added twice or more RATHER THAN NORMAL INSERT

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN 
    BEGIN TRY
        PRINT '=================================================================='
        PRINT 'Loading Bronze Layer'
        PRINT '=================================================================='


        PRINT '=================================================================='
        PRINT 'Loading Source_crm Tables'
        PRINT '=================================================================='

        PRINT '>> Truncating Table: bronze.crm_cust_info'
        PRINT '>> Inserting Table: bronze.crm_cust_info'
        TRUNCATE TABLE bronze.crm_cust_info
        BULK INSERT bronze.crm_cust_info
        FROM '/var/opt/mssql/datasets/source_crm/cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        PRINT '>> Truncating Table: bronze.crm_prd_info'
        PRINT '>> Inserting Table: bronze.crm_prd_info'
        TRUNCATE TABLE bronze.crm_prd_info
        BULK INSERT bronze.crm_prd_info
        FROM '/var/opt/mssql/datasets/source_crm/prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        PRINT '>> Truncating Table: bronze.crm_ales_details'
        PRINT '>> Inserting Table: bronze.crm_ales_details'
        TRUNCATE TABLE bronze.crm_ales_details
        BULK INSERT bronze.crm_ales_details
        FROM '/var/opt/mssql/datasets/source_crm/sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        PRINT '=================================================================='
        PRINT 'Loading Source_erp Tables'
        PRINT '=================================================================='

        PRINT '>> Truncating Table: bronze.erp_CUST_AZ12'
        PRINT '>> Inserting Table: bronze.erp_CUST_AZ12'
        TRUNCATE TABLE bronze.erp_CUST_AZ12
        BULK INSERT bronze.erp_CUST_AZ12
        FROM '/var/opt/mssql/datasets/source_erp/CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        PRINT '>> Truncating Table: bronze.erp_LOC_A101'
        PRINT '>> Inserting Table: bronze.erp_LOC_A101'
        TRUNCATE TABLE bronze.erp_LOC_A101
        BULK INSERT bronze.erp_LOC_A101
        FROM '/var/opt/mssql/datasets/source_erp/LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        
        PRINT '>> Truncating Table: bronze.erp_PX_CAT_G1V2'
        PRINT '>> Inserting Table: bronze.erp_PX_CAT_G1V2'
        TRUNCATE TABLE bronze.erp_PX_CAT_G1V2
        BULK INSERT bronze.erp_PX_CAT_G1V2
        FROM '/var/opt/mssql/datasets/source_erp/PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
    END TRY 


    BEGIN CATCH 
        PRINT '=================================================================='
        PRINT 'Error occured during loading bronze table'
        PRINT '=================================================================='
    END CATCH 
END;

EXEC bronze.load_bronze 




