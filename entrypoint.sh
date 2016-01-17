#!/bin/bash

PRESTO_COORDINATOR_URL=http://$PRESTO_PORT_8080_TCP_ADDR:$PRESTO_PORT_8080_TCP_PORT
MYSQL_URL=jdbc:mysql://$MYSQL_PORT_3306_TCP_ADDR:$MYSQL_PORT_3306_TCP_PORT/$MYSQL_DB

java -Ddw.prestoCoordinator=$PRESTO_COORDINATOR_URL \
     -Ddw.prestoCatalog=$PRESTO_CATALOG \
     -Ddw.prestoUser=$PRESTO_USER \
     -Ddw.s3AccessKey=$S3_ACCESS_KEY \
     -Ddw.s3SecretKey=$S3_SECRET_KEY \
     -Ddw.s3Bucket=airpal \
     -Ddw.dataSourceFactory.url=$MYSQL_URL \
     -Ddw.dataSourceFactory.user=$MYSQL_USER \
     -Ddw.dataSourceFactory.password=$MYSQL_PASSWORD \
     -server \
     -Duser.timezone=UTC \
     -cp build/libs/airpal-*-all.jar \
     com.airbnb.airpal.AirpalApplication \
     server \
     reference.yml
