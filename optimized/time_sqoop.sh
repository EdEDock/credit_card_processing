sqoop job \
--meta-connect jdbc:hsqldb:hsql://localhost:16000/sqoop \
--create casestudy_time \
-- import \
--connect jdbc:mysql://localhost/cdw_sapp \
--driver com.mysql.jdbc.Driver \
--query 'SELECT CONCAT(YEAR, LPAD(MONTH,2,0), LPAD(DAY,2,0)),DAY,MONTH, QUARTER(CONCAT(YEAR,"-",MONTH,"-",DAY)), YEAR,TRANSACTION_ID FROM cdw_sapp_creditcard WHERE $CONDITIONS' \
--append \
--incremental append \
--check-column TRANSACTION_ID \
--last-value 1 \
--target-dir /user/maria_dev/Credit_Card_System/Time/Optimized \
-m 1