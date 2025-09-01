# MongoDB

## Installing MongoDB in HDP Sandbox

-   Login as root
-   Go to directory

`cd /var/lib/ambari-server/resources/stacks/HDP`

-   Select appropriate version of HDP version and go the directory

`cd <version-number>`

-   Go to services

`cd services`

-   Clone mongo-ambari connector from git

`git clone https://github.com/nikunjness/mongo-ambari.git`

-   Restart Ambari

`sudo service ambari restart`

-   Login Ambari as admin
-   Goto Actions, then Add Service
-   Find and select MongoDB from the list
-   Accept defaults in each step and deploy the service
-   Complete the installation

## Install Mongo for Python

-   Run the command

`pip install pymongo` or `pip install pymongo==3.4.0`

## Download script to write/read data to/from MongoDB using Spark

`wget http://media.sundog-soft.com/hadoop/MongoSpark.py`

## Run the Spark script

`spark-submit --packages org.mongodb.spark:mongo-spark-connector_2.11:2.0.0 MongoSpark.py`
