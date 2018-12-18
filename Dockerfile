FROM postgres:10

COPY multidb.sh /docker-entrypoint-initdb.d/multidb.sh
RUN chmod ugo+x /docker-entrypoint-initdb.d/multidb.sh
