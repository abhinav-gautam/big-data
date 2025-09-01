# Phoenix

_Note: Make sure that HBase is running_

_Note: Phoenix is already installed in HDP 2.6.5_

## Start Phoenix

-   Go to directory:

`cd /usr/hdp/current/phoenix-client/`

-   Go to bin

`cd bin`

-   Start CLI for Phoenix

`python sqlline.py`

-   Quit Phoenix CLI

`!quit`

## Working with Phoenix

-   Show tables

`!tables`

-   Create table

```sql
CREATE TABLE IF NOT EXISTS us_population(
    state CHAR(2) NOT NULL,
    city VARCHAR NOT NULL,
    population BIGINT
    CONSTRAINT my_pk PRIMARY KEY (STATE, CITY)
);
```

-   Insert data into table

```sql
UPCERT INTO us_populaiton VALUES ('NY', 'New York', 65365354);
```

-   Getting data from table

```sql
SELECT * FROM us_population;
```

## Storing and loading data to HBase using Pig through Phoenix

-   Create table in HBase using Phoenix

```sql
CREATE TABLE users (
    userid INTEGER NOT NULL,
    age INTEGER,
    gender CHAR(1),
    occupation VARCHAR,
    zip VARCHAR
    CONSTRAINT pk PRIMARY KEY (userid)
);
```

-   Download Pig script

`wget http://media.sundog-soft.com/hadoop/phoenix.pig`

-   Execute Pig script

`pig phoenix.pig`
