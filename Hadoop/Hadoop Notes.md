# Hadoop

## Hadoop file system commands

-   List all files

    `hadoop fs -ls`

-   Create new directory

    `hadoop fs -mkdir ml-100k`

-   Copy from local directory to hadoop file system

    `hadoop fs -copyFromLocal u.data ml-100k/u.data`

-   List files inside directory

    `hadoop fs -ls ml-100k`

-   Delete file

    `hadoop fs -rm ml-100k/u.data`

-   Delete directory

    `hadoop fs -rmdir ml-100k`

-   List all file system commands

    `hadoop fs`

## Reset Ambari admin password

    `su root ambari-admin-password-reset`

## Installing MongoDB in HDP 2.6

-   Login as root

    `su root`

-   Go to specific directory

    `cd /var/lib/ambari-server/resources/stacks/HDP/2.6/services`

-   Download mongo-ambari connector

    `git clone https://github.com/nikunjness/mongo-ambari.git`

-   Restart ambari-server

    `ambari-server restart`

-   Login as admin in Ambari portal

-   Actions -> Add Service

-   Find MongoDB in the list

-   Keep everything as default, ignore warning, and deploy

-
