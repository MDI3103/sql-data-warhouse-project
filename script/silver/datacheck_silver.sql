--Check for NULL or Duplicate in Primary Key
--Expectation: No Result

SELECT
	cst_id,
	COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Check for unwanted spaces
SELECT
	cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

--Data Standardization & consistency
SELECT DISTINCT cst_marital_status 
FROM bronze.crm_cust_info

--Check colukn type
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'silver'
AND TABLE_NAME = 'crm_cust_info';

SELECT COLUMN_NAME ,DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'bronze'
AND TABLE_NAME = 'erp_cust_az12';

--Check fro Invalid Date Orders
SELECT*
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt

--Check Data Consistency
SELECT
	sls_sales,
	sls_quantity,
	sls_price
FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <=0 OR sls_quantity <= 0 OR sls_price <= 0
