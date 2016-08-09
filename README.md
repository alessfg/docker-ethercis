# Docker Environment for EtherCIS

Docker environment for [EtherCIS] (https://github.com/ethercis/ethercis), an open source platform compatible with the openEHR standard.

## How To Use

* EtherCIS uses a RESTful API similar to the [Ehrscape API] (https://code4health.org/platform/open_interfaces_apis/ehrscape/ehrscape_api_reference).
* The Docker image contains no data upon startup. Data can be imported into the application and Postgres database using the various queries described in the [Ehrscape API] (https://code4health.org/platform/open_interfaces_apis/ehrscape/ehrscape_api_reference).
* For more information please refer to the official [EtherCIS documentation] (https://github.com/ethercis/ethercis/tree/master/doc).

## Setup

1. Install [Docker] (https://www.docker.com).
2. Clone the repository.
3. Open a terminal in the directory where you cloned the repo.
4. Type `docker-compose up`.
5. Once the startup process completes your terminal should display a message saying:
  * `INFO - com.ethercis.vehr.Launcher.start(140) | Server listening at:http://{container-ip}:8080/`.
6. Find the ip of your Docker environment:
  * If you are using Docker toolbox this tends to be `192.168.99.100`.
  * If you are using a native Docker installation it will be `localhost`.
7. You can now connect to the RESTful API via `{docker-ip}:8888/{rest-query}`.

## Notes

* EtherCIS is still in active development. If you encounter any issues please use the [EtherCIS issue tracker] (https://github.com/ethercis/ethercis/issues).

## License

* The EtherCIS platform is licensed under the Apache License. A copy of the license can be found in the [EtherCIS subfolder] (https://github.com/alessfg/docker-ethercis/tree/master/application/ethercis-1.1.0).
* All other code is licensed under the MIT License.
