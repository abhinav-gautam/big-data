# Spark Notes

## Spark configurations

### Change Spark log level to ERROR

-   From Services, goto Spark2
-   Under Configs tab, edit Advanced spark2-log4j-properties
-   Change `log4j.rootCategory=INFO, console` to `log4j.rootCategory=ERROR, console`

## Running Spark script

`spark-submit LowestAverageRatingMovie.py`
