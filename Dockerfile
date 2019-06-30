FROM postgres:11

COPY scripts/docker-apt-upgrade /usr/local/bin/apt-upgrade
RUN apt-upgrade

COPY scripts/docker-apt-install /usr/local/bin/apt-install
RUN apt-install eatmydata

COPY scripts/multidb.sh /docker-entrypoint-initdb.d/multidb.sh
RUN chmod ugo+x /docker-entrypoint-initdb.d/multidb.sh

COPY scripts/start-postgres.sh /usr/local/bin/start-postgres.sh
ENTRYPOINT ["/usr/bin/eatmydata", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["postgres"]
