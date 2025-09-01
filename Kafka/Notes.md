# Kafka

## Starting Kafka Servers

### Windows

-   Start Zookeeper Server

`.\bin\windows\zookeeper-server-start.bat .\config\zookeeper.properties`

-   Start Kafka Server

`.\bin\windows\kafka-server-start.bat .\config\server.properties`

### HDP 2.6.5 Sandbox

-   In HDP sandbox Kafka lives under `/usr/hdp/current/kafka-broker`

`cd /usr/hdp/current/kafka-broker/bin`

_Note: Zookeeper and Kafka servers are already running in HDP sandbox_

## Working with Kafka

### Windows

-   Create topic

`.\bin\windows\kafka-topics.bat --create --topic kafka-topic --bootstrap-server localhost:9092`

-   Create a topic with multiple partitions

`.\bin\windows\kafka-topics.bat --bootstrap-server localhost:9092 --create --topic kafka-topic --partitions 3 --replication-factor 1`

-   List all topics

`.\bin\windows\kafka-topics.bat --bootstrap-server localhost:9092 --list`

-   Description of topic

`.\bin\windows\kafka-topics.bat --bootstrap-server localhost:9092 --topic kafka-topic --describe`

-   Delete topic

`.\bin\windows\kafka-topics.bat --bootstrap-server localhost:9092 --topic kafka-topic --delete`

-   Start producer

`.\bin\windows\kafka-console-producer.bat --topic kafka-topic --bootstrap-server localhost:9092`

-   Start Producer with Key and Values

`.\bin\windows\kafka-console-producer.bat --bootstrap-server localhost:9092 --property "parse.key=true" --property "key.separator=:" --topic kafka-topic`

-   Start consumer

`.\bin\windows\kafka-console-consumer.bat --topic kafka-topic --from-beginning  --bootstrap-server localhost:9092`

-   Start consumer with a consumer group

`.\bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic kafka-topic  --group test-consumer-group --property print.key=true --property key.separator=" = " --from-beginning`

-   Check current status of offsets

`.\bin\windows\kafka-consumer-groups.bat --bootstrap-server localhost:9092 --describe --all-groups`

### HDP Sandbox

_All commands should be executed under `/usr/hdp/current/kafka-broker/bin` directory_

-   Create topic

`./kafka-topics.sh --create --zookeeper sandbox-hdp.hortonworks.com:2181 --replication-factor 1 --partitions 1 --topic kafka-topic`

-   List all topics

`./kafka-topics.sh -list --zookeeper sandbox-hdp.hortonworks.com:2181`

-   Start producer

`./kafka-console-producer.sh --broker-list sandbox-hdp.hortonworks.com:6667 --topic kafka-topic`

_Note: 6667 is an open and free port in HDP sandbox._

-   Start consumer

`./kafka-console-consumer.sh --zookeeper sandbox-hdp.hortonworks.com:2181 --topic kafka-topic --from-beginning`

## Kafka Connector - Log Processing Use Case

### Configurations

_Note: Copy these files somewhere else and make changes._

**connect-standalone.properties**

Here we specify our server with open free port on HDP sandbox.

```
bootstrap.servers=sandbox-hdp.hortonworks.com:6667
```

**connect-file-sink.properties**

Here we specify the output file and Kafka topic

```
file=/home/maria_dev/logout.txt
topic=log-test
```

**connect-file-source.properties**

Here we specify the input file and the same Kafka topic

```
file=/home/maria-dev/access_log_small.txt
topic=log-test
```

### Running connector

-   Download sample log file

`wget http://media.sundog-soft.com/hadoop/access_log_small.txt`

-   Create the Kafka topic named `log-test`

`./kafka-topics.sh --create --zookeeper sandbox-hdp.hortonworks.com:2181 --replication-factor 1 --partitions 1 --topic log-test`

-   Spin up a consumer to see data published in realtime

`./kafka-console-consumer.sh --zookeeper sandbox-hdp.hortonworks.com:2181 --topic log-test --from-beginning`

-   To start the connector goto directory `/usr/hdp/current/kafka-broker/bin`

`./connect-standalone.sh ~/connect-standalone.properties ~/connect-file-source.properties ~/connect-file-sink.properties`

-   Add line to input file to see changes in realtime

`echo "This is a new line" >> access_log_small.txt`
