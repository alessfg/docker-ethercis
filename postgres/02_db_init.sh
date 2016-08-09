#!/bin/bash
# Populate database schema with script

psql -U postgres -d ethercis <<-EOSQL
  \i ./scripts/pgsql_ehr.ddl
EOSQL
