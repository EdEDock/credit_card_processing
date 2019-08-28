DROP TABLE IF EXISTS CDW_SAPP_D_CREDIT_CARD_EXTERNAL;
CREATE EXTERNAL TABLE CDW_SAPP_D_CREDIT_CARD_EXTERNAL
	(CUST_CC_NO VARCHAR(16),
     TIMEID VARCHAR(8),
	 CUST_SSN INT,
	 BRANCH_CODE BIGINT,
	 TRANSACTION_TYPE VARCHAR(30),
	 TRANSACTION_VALUE DECIMAL(20,3),
	 TRANSACTION_ID INT
        )	 
row format delimited 
fields terminated by ','
lines terminated by '\n'
LOCATION "/user/maria_dev/Credit_Card_System/Credit_Card";

DROP TABLE IF EXISTS CDW_SAPP_D_CREDIT_CARD;
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
CREATE TABLE CDW_SAPP_D_CREDIT_CARD
	(CUST_CC_NO VARCHAR(16),
     TIMEID VARCHAR(8),
	 CUST_SSN INT,
	 BRANCH_CODE BIGINT,
	 TRANSACTION_VALUE DECIMAL(20,3),
	 TRANSACTION_ID INT
        )
PARTITIONED BY (TRANSACTION_TYPE VARCHAR(30))
row format delimited 
fields terminated by ','
lines terminated by '\n'
LOCATION "/user/maria_dev/Credit_Card_System/Credit_Card/Partitioned";