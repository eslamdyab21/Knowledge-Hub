Docker containers are an easy, lite and efficient way to bundle applications with its requirements and make it ready to deploy. 
It builds on-top of the kernel host (Linux or Windows kernel) layer by layer in the user mode, thus faster and lighter than VMs.

This bundle form a docker image which when running forms a docker container. 
Containers to images are like vm instance to vm template.

Docker software runs on Linux, Mac and Windows. but the docker containers types are only Linux and Windows (Kernel).

After installing docker in the system, we can see its client and server info
```java
❯ docker info
Client:
 Context:    default
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.10.4
    Path:     /usr/libexec/docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v2.17.2
    Path:     /usr/libexec/docker/cli-plugins/docker-compose

Server:
ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/info": dial unix /var/run/docker.sock: connect: permission denied
errors pretty printing info
```
The client provides us the controls like the CLI, and the server runs the background services needed for docker.
As you can see `ERROR: permission denied` in the server, it needs `sudo`, but in order to user docker without having to type sudo every time we can add the docker group to our user group 
```bash
❯ groups
eslamdyab adm cdrom sudo dip plugdev kvm lpadmin lxd sambashare libvirt

❯ sudo usermod -aG docker eslamdyab

❯ groups
eslamdyab adm cdrom sudo dip plugdev kvm lpadmin lxd sambashare libvirt docker
```


<br>

## Basic commands
- Install a docker image
	```java
	❯ docker image pull python:3.8
	3.8: Pulling from library/python
	b0248cf3e63c: Pull complete 
	127e97b4daf7: Pull complete 
	0336c50c9f69: Pull complete 
	1b89f3c7f7da: Pull complete 
	2d6277217976: Pull complete 
	273fcda609d8: Pull complete 
	f7fe71ed62be: Pull complete 
	6aa73e60af69: Pull complete 
	d7aff9f220b1: Pull complete 
    ```
    where 3.8 is the python version. It will start pulling the layers of those image one by one.

<br>

- list all images 
  ```java
  ❯ docker image ls
	REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
	python            3.8       8ada2258068b   10 days ago     906MB
	ubuntu            20.04     1c5c8d0b973a   6 weeks ago     72.8MB
	hello-world       latest    feb5d9fea6a5   19 months ago   13.3kB
  ```

<br>

- delete an image 
  ```java
  ❯ docker image rm hello-world
	Untagged: hello-world:latest
	Untagged: hello-world@sha256:4e83453afed1b4fa1a3500525091dbfca6ce1e66903fd4c01ff015dbcb1ba33e
	Deleted: sha256:feb5d9fea6a5e9606aa995e879d862b825965ba48de054caab5ef356dc6b3412
  ```

<br>

- Create a container out of an image
  ```java
  ❯ docker container create -it python:3.8 /bin/bash
	c926a2ad91728181f5e61564059b439d958c818f2e33ca6e5619d3edc7933f27
  
  ❯ docker container ls -a
	CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS                    PORTS     NAMES
    c926a2ad9172   python:3.8        "/bin/bash"              55 seconds ago   Created                             naughty_ramanujan 
  ```
  where `-it` is short for interactive terminal and we spisfy to run `bash` when starting the container, to start it:
  ```java
  ❯ docker container start -i c926a2ad9172
	root@c926a2ad9172:/# hostname
	c926a2ad9172

	root@c926a2ad9172:/# ps
    PID TTY          TIME CMD
      1 pts/0    00:00:00 bash
  ```  
  where `-i` for interactive mode to interact with the container, 
  we could've used the container name `naughty_ramanujan` instated of its id `c926a2ad9172`.

<br>

> Note that the container is the first process, so when we exit the container, the process is terminated thus the container too.
```java 
❯ docker container ls -a
CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS                     PORTS     NAMES
c926a2ad9172   python:3.8        "/bin/bash"              12 minutes ago   Exited (0) 6 seconds ago             naughty_ramanujan
``` 

<br>

- We can replace the create and start step with just run
  ```python
  ❯ docker container run -it python:3.8 /bin/bash
    root@fb44d4a823fb:/# exit
  ❯ 
   ```
   it will create a new container 
   ```python
   ❯ docker container ls -a
	CONTAINER ID   IMAGE             COMMAND                  CREATED              STATUS                     PORTS     NAMES
	fb44d4a823fb   python:3.8        "/bin/bash"              About a minute ago   Exited (0) 9 seconds ago             inspiring_taussig
	c926a2ad9172   python:3.8        "/bin/bash"              19 minutes ago       Exited (0) 7 minutes ago             naughty_ramanujan
   ```
   