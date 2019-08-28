SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO TABLE CDW_SAPP_D_CUSTOMER_PARTITIONED
PARTITION(CUST_ZIP)
SELECT CUST_SSN, CUST_F_NAME, CUST_M_NAME, CUST_L_NAME, CUST_CC_NO, CUST_STREET, CUST_CITY, CUST_STATE, CUST_COUNTRY,CUST_PHONE, CUST_EMAIL, LAST_UPDATED, CUST_ZIP
FROM CDW_SAPP_D_CUSTOMER_EXTERNAL;