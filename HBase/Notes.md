# HBase

## Start HBase and REST services

-   Start HBase service through Ambari
-   Start HBase REST service using command
    `/usr/hdp/current/hbase-master/bin/hbase-daemon.sh start rest -p 8000 --infoport 8001`

## Install starbase

`pip install starbase`

## Load Data to HBase from HDFS using Pig

_importtsv script can also be used to load data to HBase from HDFS_

-   To load data to Hbase using Pig we need to make sure that the table exists in HBase
-   Start HBase Shell
    `hbase shell`
-   List existing tables
    `list`
-   Create `users` table with `userinfo` column family
    `create 'users', 'userinfo'`
-   Execute Pig script to load data to HBase
    `pig hbase.pig`
-   Load Shell again, check users table
    `scan 'users'`
