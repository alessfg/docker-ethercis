# Docker Environment for EtherCIS

Docker environment for [EtherCIS] (https://github.com/ethercis/ethercis), an open source platform compatible with the openEHR standard.

## How To Use

* EtherCIS uses a RESTful API similar to the [Ehrscape API] (https://code4health.org/platform/open_interfaces_apis/ehrscape/ehrscape_api_reference).
* The Docker image contains no data upon startup. Data can be imported into the application and Postgres database using the various queries described in the [Ehrscape API] (https://code4health.org/platform/open_interfaces_apis/ehrscape/ehrscape_api_reference).
* For more information please refer to the official [EtherCIS documentation] (https://github.com/ethercis/ethercis/tree/master/doc).

## Setup

1. Install the latest version of [Docker] (https://www.docker.com). Docker Compose version 2 is required.
2. Clone the repository.
3. Open a terminal in the directory where you cloned the repo.
4. Run `docker-compose up`.
5. Once the startup process completes your terminal should display a message saying:
  * `INFO - com.ethercis.vehr.Launcher.start(140) | Server listening at:http://{container-ip}:8080/`.
6. Find the ip of your Docker environment:
  * If you are using Docker toolbox this tends to be `192.168.99.100`.
  * If you are using a native Docker installation it will be `localhost`.
7. You can now connect to the RESTful API via `{docker-ip}:8888/{rest-query}`.

## Data Storage and Persistence

The postgres Docker container stores data internally at `/var/lib/postgresql/data`. By default, this volume is not mapped to any volume in the host OS. If you destroy the Docker container the data will only be persisted within a hidden volume partition; which will result in new containers not being able to access the database data. This is by design as local volume partitions are dependent on the host OS and thus specifing a particular volume can lead to undesired errors. To map the volume where data is to be persisted follow the [Docker volume instructions] (https://docs.docker.com/engine/tutorials/dockervolumes) and modify the Dockerfile and docker-compose.yml postgres service accordingly.

## Setup with OpenEMPI

Most applications will require the usage of both an EMPI and EHR server. This can be done by following these instructions:

1. Clone this repository and the [Docker OpenEMPI repository] (https://github.com/alessfg/docker-openempi) into the same directory.
2. Download the docker-compose gist available [here] (https://gist.github.com/alessfg/f9c4f330850858b9afaea33de5595774) into the directory root.
3. Run `docker-compose up`.

## Notes

* EtherCIS is still in active development. If you encounter any issues please use the [EtherCIS issue tracker] (https://github.com/ethercis/ethercis/issues).

## License

* The EtherCIS platform is licensed under the Apache License. A copy of the license can be found in the [EtherCIS subfolder] (https://github.com/alessfg/docker-ethercis/tree/master/application/ethercis-1.1.0).
* All other code is licensed under the MIT License.
