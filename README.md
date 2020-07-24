# Development Docker deployment for Personium

## Requirements

The followings must be installed and configured in advance to build and run Personium Unit offered from this repository.

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Windows 10 User  
Special requirements if you want to run Docker in Windows 10. Follow the [official instructions from Microsoft](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to install WSL 2.  
> I highly recommend to check out [A Linux Dev Environment on Windows with WSL 2, Docker Desktop and More](https://nickjanetakis.com/blog/a-linux-dev-environment-on-windows-with-wsl-2-docker-desktop-and-more) before you start installing anything.  

> Another useful tutorial on [Using Docker in Windows for WSL2](https://code.visualstudio.com/blogs/2020/03/02/docker-in-wsl2).  

## Setup  
Please refer to the [Overview of docker-compose CLI](https://docs.docker.com/compose/reference/overview/) for details.  

### Step 1. Build your services  
Execute the following commands inside the cloned repository in your local environment. Execute the commands again after changing any docker related files.  

```console
# docker-compose build
# docker-compose up -d
```
> "-d" option allows the containers to be run in the background   

### Step 2. Initialize your Personium Unit  
After the "docker-compose up -d" command finished building and starting the services, execute following command on your host machine to create an admin Cell so that you can manage the Personium Unit.  

```cmd
$ ./init.sh
```

After execution, a file named `unitadmin_account` will be created.
The file contains login information to the admin Cell.

To use management tool, see [here](https://personium.io/docs/en/next/getting-started/appdev-management-tool/).

#### Windows 10 User  
Extra softwares are required to execute the above command successfully in Windows 10. However, you can execute the following commands directly in Windows Terminal or Command Prompt.  

1. Docker command to copy local file to container's folder.  

        personium-docker> docker cp ./init.sh personium-docker_nginx_1:/root/init.sh  

1. Docker command to start a bash prompt that connects to the container.  

        personium-docker> docker exec -it personium-docker_nginx_1 /bin/bash  

1. Execute the following commands to access "init.sh" and start the shell script.  

        root@7aeb90f09ec5:/# cd /root    
        root@7aeb90f09ec5:~# ls -l    
        total 8    
        -rwxr-xr-x 1 root root 4583 Jul 20 09:36 init.sh    
        root@7aeb90f09ec5:~# bash init.sh    

1. Execute the follwoing commands to verify the contents of "unitadmin_account".  
  
        root@7aeb90f09ec5:~# ls -l  
        total 12  
        -rwxr-xr-x 1 root root 4583 Jul 20 09:36 init.sh  
        -rw-r--r-- 1 root root  111 Jul 23 15:19 unitadmin_account  
        root@7aeb90f09ec5:~# cat unitadmin_account  


#### Note

Default configurations are as follows.

* `unitScheme=http`
* `pathBasedCellUrl.enabled=true`

So a cell URL is `http://localhost/alice/`, not `https://alice.localhost/`.

## Start/Stop your services  
The following commands are useful for starting or stopping the built servcies.

```console
# docker-compose start
# docker-compose stop
```