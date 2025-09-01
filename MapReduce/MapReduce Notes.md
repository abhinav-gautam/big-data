# MapReduce

## Install mrjob on HDP 2.65

1. `yum-config-manager --save --setopt=HDP-SOLR-2.6-100.skip_if_unavailable=true`
2. `yum install https://repo.ius.io/ius-release-el7.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm`
3. `yum install python-pip`
4. `pip install pathlib`
5. `pip install mrjob==0.7.4`
6. `pip install PyYAML==5.4.1`
7. `yum install nano`

## Run mrjob

### Run locally

`python RatingsBreakdown.py u.data`

### Run on Hadoop

`python RatingsBreakdown.py -r hadoop --hadoop-streaming-jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar u.data`
