#!/bin/bash
echo "Running Optimized Case Study Program...."
echo "Moving required files to HDFS...."
#hadoop fs -mkdir -p /user/maria_dev/casestudy_files/optimized
#hadoop fs -put -f optimized/* /user/maria_dev/casestudy_files/optimized
echo " "
echo "Creating Metastore Sqoop Jobs"
sqoop-metastore &
pwd
bash branch_sqoop.sh
bash customer_sqoop.sh
bash creditcard_sqoop.sh
bash time_sqoop.sh
echo "Done!"
