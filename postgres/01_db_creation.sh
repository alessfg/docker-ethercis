#!/bin/bash
# Create EtherCIS database and required extensions

psql -U postgres <<-EOSQL
  CREATE DATABASE "ethercis";
  CREATE EXTENSION "uuid-ossp";
  CREATE EXTENSION "temporal_tables";
  CREATE EXTENSION "ltree";
  CREATE EXTENSION "jsquery";
EOSQL
