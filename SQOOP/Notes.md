# SQOOP

## Command to open MySQL shell as root

`mysql -u root -p`

_Password - hadoop_

## Steps for setting up default root password in MySQL

**CMD**

-   `su root`
-   `systemctl stop mysqld`
-   ` systemctl set-environment - ``MYSQLD_OPTS="--skip-grant-tables --skip-networking" `
-   `systemctl start mysqld`
-   `mysql -uroot`

**Mysql cmd**

-   `FLUSH PRIVILEGES;`
-   `alter user 'root'@'localhost' IDENTIFIED BY 'hadoop'`;
-   `FLUSH PRIVILEGES;`
-   `QUIT;`

**CMD**

-   `systemctl unset-environment MYSQLD_OPTS`
-   `systemctl restart mysqld`

## Download script to upload movie data to MySQL

`wget http://media.sundog-soft.com/hadoop/movielens.sql`

## Set names and character sets to utf8

`SET NAMES 'utf8';`
`SET CHARACTER SET utf8;`

## Load data using the `movielens.sql` script

`source movielens.sql;`

## Describe table - shows fields, types, etc

`describe <table_name>;`

`describe ratings;`

## Give access to root user to access movielens database

`GRANT ALL PRIVILEGES ON movielens.* TO root@localhost IDENTIFIED BY 'hadoop';`
