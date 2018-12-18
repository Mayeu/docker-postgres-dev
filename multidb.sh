#!/bin/bash

# strict mode
set -ex
#set -euo pipefail
#IFS=$'\n\t'

# readonly what we need to stay the same
readonly POSTGRES_ADDITIONAL_DB
readonly POSTGRES_USER
readonly POSTGRES_DB

# ensure we have DBs to process
if test -z "${POSTGRES_ADDITIONAL_DB:-}"; then
  echo "multidb: no databases to create"
  exit 0
fi

echo "POSTGRES_ADDITIONAL_DB: $POSTGRES_ADDITIONAL_DB"

# Split on ','
IFS=',' read -ra databases <<< "${POSTGRES_ADDITIONAL_DB}"
for database in "${databases[@]}"; do
  # Create the DB
  echo "multidb: creating '${database}'..."
  psql -v ON_ERROR_STOP=1                \
       --username "$POSTGRES_USER"       \
       --dbname "$POSTGRES_DB" <<-EOSQL
CREATE DATABASE "$database";
GRANT ALL PRIVILEGES ON DATABASE "$database" TO "$POSTGRES_USER";
EOSQL
done
