SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO TABLE CDW_SAPP_D_CREDIT_CARD_PARTITIONED
PARTITION(TRANSACTION_TYPE)
SELECT CUST_CC_NO, TIMEID, CUST_SSN, BRANCH_CODE, TRANSACTION_VALUE, TRANSACTION_ID, TRANSACTION_TYPE
FROM CDW_SAPP_D_CREDIT_CARD_EXTERNAL;