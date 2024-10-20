FROM postgres:latest

COPY ./sql/V1_01_database_init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
