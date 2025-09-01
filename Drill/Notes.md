# Drill

## Installation

-   Download Drill 1.12.0

`wget https://archive.apache.org/dist/drill/drill-1.12.0/apache-drill-1.12.0.tar.gz`

-   Decompress the downloaded file

`tar -xxvf apache-drill-1.12.0.tar.gz`

-   Start Drill service

`cd apache-drill-1.12.0`

`bin/drillbit.sh start -Ddrill.exec.port=8765`

OR

`bin/drillbit.sh start -Ddrill.exec.http.port=8765`

-   Start Drill UI in browser, goto `127.0.0.1:8765`

-   Stop Drill service

`bin/drillbit.sh stop`
