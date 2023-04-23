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
