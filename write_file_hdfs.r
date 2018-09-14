## sparklyr code to store the dataset in HDFS using Spark 
library(sparklyr)

## spark connect
sc <- spark_connect(master = "yarn-client")

## first read the dataset from the R datafile
transactions = readRDS("transactions.RDs")

## upload to spark 
trx_tbl  = copy_to(sc, transactions, overwrite = TRUE)

## write to hdfs
spark_write_csv(trx_tbl, "/user/clouderanA/Andre/transactions.csv", 
                header = FALSE, delimiter = ",",
                mode = "overwrite")

## disconnect from spark 
spark_disconnect(sc)

