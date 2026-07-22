use DataWarehouse

IF OBJECT_ID ('bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info(
cst_id NVARCHAR(MAX),
cst_key NVARCHAR(MAX),
cst_firstname NVARCHAR(MAX),
cst_lastname NVARCHAR(MAX),
cst_marital_status NVARCHAR(MAX),
cst_gndr NVARCHAR(MAX),
cst_create_date NVARCHAR(MAX),
);


IF OBJECT_ID ('bronze.crm_prd_info','U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info(
prd_id NVARCHAR(MAX),
prd_key NVARCHAR(MAX),
prd_nm NVARCHAR(MAX),
prd_cost NVARCHAR(MAX),
prd_line NVARCHAR(MAX),
prd_start_dt NVARCHAR(MAX),
prd_end_dt NVARCHAR(MAX),
);

IF OBJECT_ID ('bronze.crm_sales_details','U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(MAX),
sls_prd_key NVARCHAR(MAX),
sls_cust_id NVARCHAR(MAX),
sls_order_dt NVARCHAR(MAX),
sls_ship_dt NVARCHAR(MAX),
sls_due_dt NVARCHAR(MAX),
sls_sales NVARCHAR(MAX),
sls_quantity NVARCHAR(MAX),
sls_price NVARCHAR(MAX),
);


IF OBJECT_ID ('bronze.erp_cust_az12','U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12(
cid NVARCHAR(MAX),
bdate NVARCHAR(MAX),
gen NVARCHAR(MAX)
);

IF OBJECT_ID ('bronze.erp_loc_a101','U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101(
cid NVARCHAR(MAX),
cntry NVARCHAR(MAX)
);


IF OBJECT_ID ('bronze.erp_px_cat_g1v2','U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2(
id NVARCHAR(MAX),
cat NVARCHAR(MAX),
subcat NVARCHAR(MAX),
maintenance NVARCHAR(MAX)
);
