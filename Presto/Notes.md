# Presto

Documentation - https://prestodb.io/getting-started/

## Installing Presto

-   Download Presto

`wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.286/presto-server-0.286.tar.gz`

-   Unpack Presto

`ta -xvf presto-server-0.286.tar.gz`

-   Goto directory

`cd presto-server-0.286`

-   Download config files

`wget http://media.sundog-soft.com/hadoop/presto-hdp-config.tgz`

-   Unpack config tarball

`tar -xvf presto-hdp-config.tgz`

-   Goto bin

`cd bin`

-   Download Command Line Interface

`wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.286/presto-cli-0.286-executable.jar`

-   Rename CLI executable

`mv presto-cli-0.286-executable.jar presto`

-   Make executable

`chmod +x presto`

-   Start Presto server

Go back directory, `cd ..`

`bin/launcher start`

-   Open Presto dashboard

Go to `127.0.0.1:8090` in browser.

-   Connect Presto to Hive

`bin/presto --server 127.0.0.1:8090 --catalog hive`

-   Stop Presto server

`bin/launcher stop`

## Working with Presto

-   Show tables in a database

```sql
show tables from default;
```

-   Get data from table

```sql
select * from default.ratings limit 10;
```

## Using Presto to query both Cassandra and Hive

-   Start Cassandra service

`service cassandra start`

-   Start Cassandra Thrift server

`nodetool enablethrift`

-   Configure Cassandra config for Presto

`cd presto-server-0.286/etc/catalog`

-   Create `'cassandra.properties'` with below content

```
connector.name=cassandra
cassandra.contact-points=127.0.0.1
```

-   Start Presto server again

`bin/launcher start`

-   Connect Presto with Cassandra and Hive

`bin.presto --server 127.0.0.1:8090 --catalog hive,cassandra`

-   Show all tables in Cassandra's movielens database

`show tables from cassandra.movielens;`

-   Describe users table

`describe cassandra.movielens.users;`

-   Get data from Cassandra and Hive

```sql
select * from cassandra.movielens.users limit 10;
```

```sql
select * from hive.default.ratings limit 10;
```

-   Query by joining the two tables

```sql
select u.occupation, count(*)
from hive.default.ratings r
join cassandra.movielens.users u
on r.user_id = u.user_id
group by u.occupation;
```
