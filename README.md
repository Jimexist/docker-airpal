# docker-airpal
Dockerize Airpal

## Usage

This image is meant to be used with `presto` and `mysql` docker containers, assuming that `presto` is linked using port `8080` and `mysql` is linked using `3306`.

The `$MYSQL_USER`, `$MYSQL_PASSWORD`, and `$MYSQL_DATABASE` should be passed in (by either `ansible` or `docker-compose`).
