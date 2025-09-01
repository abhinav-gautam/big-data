set zookeeper.znode.parent '/hbase-unsecure'
REGISTER /usr/hdp/current/phoenix-client/phoenix-client.jar

users = LOAD '/user/maria_dev/ml-100k/u.user' 
USING PigStorage('|') 
AS (userid:int, age:int, gender:chararray, occupation:chararray, zip:chararray);

STORE users into 'hbase://users' using
    org.apache.phoenix.pig.PhoenixHBaseStorage('localhost','-batchSize 5000');

occupations = load 'hbase://table/users/userid,occupation' using org.apache.phoenix.pig.PhoenixHBaseLoader('localhost');

grouped = GROUP occupations BY occupation; 
count = FOREACH grpd GENERATE group AS occupation,COUNT(occupations);
DUMP cnt;  
