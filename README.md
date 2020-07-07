# Development Docker deployment for Personium

## Requirements

The following are installed.

* docker
* docker-compose

## Usage

### First Start

```console
# docker-compose build
# docker-compose up
```

### Start/Stop

```console
# docker-compose start
# docker-compose stop
```

## Initial cell creation for administration

Execute following command on your host machine.

```cmd
$ ./init.sh
```

After execution, a file named `unitadmin_account` will be created.
The file contains access information to the Cell to administrate.

To use management tool, see [here](https://personium.io/docs/en/next/getting-started/appdev-management-tool/).

### Note

Default configurations are as follows.

* `unitScheme=http`
* `pathBasedCellUrl.enabled=true`

So a cell URL is `http://localhost/alice/`, not `https://alice.localhost/`.
