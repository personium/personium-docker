# Development Docker deployment for Personium

## Requirements

The followings must be installed and configured in advance to build and run Personium Unit offered from this repository.

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Windows 10 User  
Special requirements if you want to run Docker in Windows 10. Follow the [official instructions from Microsoft](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to install WSL 2.  
> I highly recommend to check out [A Linux Dev Environment on Windows with WSL 2, Docker Desktop and More](https://nickjanetakis.com/blog/a-linux-dev-environment-on-windows-with-wsl-2-docker-desktop-and-more) before you start installing anything.  

> Another useful tutorial on [Using Docker in Windows for WSL2](https://code.visualstudio.com/blogs/2020/03/02/docker-in-wsl2).  

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
