sqoop job \
--meta-connect jdbc:hsqldb:hsql://localhost:16000/sqoop \
--create casestudy_customer \
-- import \
--connect jdbc:mysql://localhost/cdw_sapp \
--driver com.mysql.jdbc.Driver \
--query 'SELECT SSN, CONCAT(UCASE(SUBSTRING(FIRST_NAME, 1, 1)),LOWER(SUBSTRING(FIRST_NAME, 2))), LOWER(MIDDLE_NAME), CONCAT(UCASE(SUBSTRING(LAST_NAME, 1, 1)),LOWER(SUBSTRING(LAST_NAME, 2))), CREDIT_CARD_NO, CONCAT(APT_NO," ",STREET_NAME), CUST_CITY, CUST_STATE, CUST_COUNTRY, CUST_ZIP, CONCAT(SUBSTRING(CUST_PHONE, 1, 3),"-",SUBSTRING(CUST_PHONE,4,4)), CUST_EMAIL, LAST_UPDATED FROM cdw_sapp_customer WHERE $CONDITIONS' \
--append \
--incremental lastmodified \
--check-column LAST_UPDATED \
--last-value '2000-01-01 00:00:00' \
--target-dir /user/maria_dev/Credit_Card_System/Customer/Optimized \
-m 1