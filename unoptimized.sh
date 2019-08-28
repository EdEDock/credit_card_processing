echo "Creating External and Internal Project Tables"
echo "Creating Branch Tables...."
hive -f pre/hive_create_branch_tables.hql
echo " "
echo "Creating Credit Card Tables...."
hive -f pre/hive_create_credit_card_tables.hql
echo " "
echo "Creating Customer Tables...."
hive -f pre/hive_create_customer_tables.hql
echo " "
echo "Creating Time Tables...."
hive -f pre/hive_create_time_tables.hql
echo " "
echo "Moving required files to HDFS...."
hadoop fs -mkdir -p /user/maria_dev/casestudy_files/unoptimized
hadoop fs -put -f unoptimized/* /user/maria_dev/casestudy_files/unoptimized
echo " "
echo "Starting Unoptimized Oozie Job...."
oozie job -oozie http://localhost:11000/oozie -config /casestudy/unoptimized/job.properties -run
echo " "
echo "Done!"
