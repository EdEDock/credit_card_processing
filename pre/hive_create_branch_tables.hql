DROP TABLE IF EXISTS CDW_SAPP_D_BRANCH_EXTERNAL;

CREATE EXTERNAL TABLE CDW_SAPP_D_BRANCH_EXTERNAL 
	(BRANCH_CODE INT,
	 BRANCH_NAME VARCHAR(25),
	 BRANCH_STREET VARCHAR(30),
	 BRANCH_CITY VARCHAR(30),
	 BRANCH_STATE VARCHAR(30),
	 BRANCH_ZIP VARCHAR(7),
	 BRANCH_PHONE VARCHAR(13),
	 LAST_UPDATED TIMESTAMP) 
row format delimited 
fields terminated by ',' 
lines terminated by '\n' 
LOCATION '/user/maria_dev/Credit_Card_System/Branch/';

DROP TABLE IF EXISTS CDW_SAPP_D_BRANCH;
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
CREATE TABLE CDW_SAPP_D_BRANCH
	(BRANCH_CODE INT,
	 BRANCH_NAME VARCHAR(25),
	 BRANCH_STREET VARCHAR(30),
	 BRANCH_CITY VARCHAR(30),
	 BRANCH_ZIP VARCHAR(7),
	 BRANCH_PHONE VARCHAR(13),
	 LAST_UPDATED TIMESTAMP) 
PARTITIONED BY (BRANCH_STATE VARCHAR(30))
row format delimited 
fields terminated by ','
lines terminated by '\n'
LOCATION "/user/maria_dev/Credit_Card_System/Branch/Partitioned";