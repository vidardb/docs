# Quick Start with Docker

We can easily deploy PostgreSQL with VidarDB in Docker container. The following documentation will guide you to run VidarDB successfully in a few minutes.

## Requirement

- [Docker](https://docs.docker.com/install/#supported-platforms)

## Run a VidarDB's Docker container

```sh
# before running the following command, we should ensure that both the container name 
# 'postgresql' and the port '5432' have not been used in our environment
docker run -d --name postgresql -p 5432:5432 vidardb/postgresql:vidardb-latest
```

After executing the before command, the `postgresql` container will start and initialize
the database. Normally we should wait for 25~30s, and then its status will become `healthy`.
We can run the following command to query the container status of `postgresql`:

```sh
docker ps -f name=postgresql
```

## Connect to the PostgreSQL

```sh
psql -h 127.0.0.1 -p 5432 -U postgres
```

Please note that PostgreSQL client should already be installed before running the container.

## Install MADLib

If you need to install MADLib for a new created database in `postgresql` container, you can run the following instruction:

```sh
docker exec -it postgresql sh -c "install-madlib.sh -U <YOUR DATABASE USERNAME> -P <YOUR DATABASE PASSWORD> -D <YOUR DATABASE NAME>"
```

For example, if you have created a new database named `madlib`, and the username is `madlib` and no password,
then you can install madlib like this:

```sh
docker exec -it postgresql sh -c "install-madlib.sh -U madlib -D madlib"
```
