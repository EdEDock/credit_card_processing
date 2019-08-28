DROP TABLE IF EXISTS CDW_SAPP_D_TIME_EXTERNAL;
CREATE EXTERNAL TABLE CDW_SAPP_D_TIME_EXTERNAL
	(TIMEID	  VARCHAR(8),
	 DAY	  TINYINT,
	 MONTH	  TINYINT,
	 QUARTER  VARCHAR(8),
     YEAR	  SMALLINT,
	 TRANSACTION_ID INT)	 
row format delimited 
fields terminated by ','
lines terminated by '\n'
LOCATION "/user/maria_dev/Credit_Card_System/Time";

DROP TABLE IF EXISTS CDW_SAPP_D_TIME;
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
CREATE TABLE CDW_SAPP_D_TIME
	(TIMEID	  VARCHAR(8),
	 DAY	  TINYINT,
	 MONTH	  TINYINT,
     YEAR	  SMALLINT,
	 TRANSACTION_ID INT)	 
PARTITIONED BY (QUARTER VARCHAR(8))
row format delimited 
fields terminated by ','
lines terminated by '\n'
LOCATION "/user/maria_dev/Credit_Card_System/Time/Partitioned";