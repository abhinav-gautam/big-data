# Cassandra

## Installing Cassandra in HDP 2.6

-   Login as root
-   Make sure Python 2.7 is installed
-   Configure yum with Cassandra repo

    `cd /etc/yum.repos.d`

-   Create new file names `datastax.repo`
-   Write in file
    ```
    [datastax]
    name = DataStax Repo for Apache Cassandra
    baseurl = http://rpm.datastax.com/community
    enabled = 1
    gpgcheck = 0
    ```
-   Install Cassandra

    `yum install dsc30`

-   Start Cassandra

    `service cassandra start`

## Setting up table in Cassandra

-   Start Cassandra

    `service cassandra start`

-   Start Cassandra Shell

    `cqlsh`

    If above command shows version mismatch issue

    `cqlsh --cqlversion="3.4.0"`

-   Create keyspace

    `CREATE KEYSPACE movielens WITH replication={'class': 'SimpleStrategy', 'replication_factor': '1'} AND durable_writes=true;`

-   Use keyspace

    `USE movielens;`

-   Create table

    `CREATE TABLE users (user_id int, age int, gender text, occupation text, zip text, PRIMARY KEY(user_id));`

-   Describe table

    `DESCRIBE TABLE users;`

-   Show table data

    `SELECT * FROM users;`

## Running Spark script to work with Cassandra

`spark-submit --packages com.datastax.spark:spark-cassandra-connector_2.11:2.3.1 CassandraSpark.py`
