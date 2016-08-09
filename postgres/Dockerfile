FROM postgres:9.4

MAINTAINER Alessandro Fael Garcia <alessfg@hotmail.com>

LABEL EtherCIS-Version="1.1.0" \
      Description="Docker image for the EtherCIS database"

# The following list of commands is executed in the same RUN block to
# save as much space as possible in the final Docker image
# Get packages necessary to install required extensions for EtherCIS database
RUN apt-get update && apt-get install -y \
	bison \
	flex \
	gcc \
	git \
	postgresql-server-dev-9.4 \
	make \
# Install temporal tables extension
  && git clone https://github.com/arkhipov/temporal_tables \
  && cd temporal_tables \
	&& make \
	&& make install \
	&& cd .. \
	&& rm -rf temporal_tables \
# Install jsquery extension
  && git clone https://github.com/postgrespro/jsquery \
  && cd jsquery \
	&& make USE_PGXS=1 \
	&& make install USE_PGXS=1 \
	&& cd .. \
	&& rm -rf jsquery \
# Remove no longer required packages
  && apt-get purge -y \
	bison \
	flex \
	gcc \
	git \
	postgresql-server-dev-9.4 \
	make \
	&& apt-get autoremove -y

# Copy files required to initialise Postgres with the EtherCIS database schema
COPY ./scripts ./scripts
COPY ./01_db_creation.sh ./docker-entrypoint-initdb.d
COPY ./02_db_init.sh ./docker-entrypoint-initdb.d
