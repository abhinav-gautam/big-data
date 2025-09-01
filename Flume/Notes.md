# Flume

## Setting up Flume

-   Download sample configuration file

_Note: This configuration file is to create a simple agent that monitor a netcat server and logs the output in console._

`wget http://media.sundog-soft.com/hadoop/example.conf`

-   Flume lives in directory `/usr/hdp/current/flume-server`, therefore goto directory

`cd /usr/hdp/current/flume-server/bin`

-   Run Flume agent

`flume-ng agent --conf conf --conf-file ~/example.conf --name a1 -D flume.root.logger=INFO,console`

-   Connect to netcat server

`telnet localhost 44444`

_Note: In HDP 2.6.5, Flume's logger output to the console doesn't work. We will see it logged in the file `/var/log/flume/flume.log.file`_
