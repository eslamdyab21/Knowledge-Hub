A vm `x` is hosting an app on port 8080, its ip is `192.168.122.223` and username `dyab`, the host machine is taking an ip from the router `192.168.1.7` and there are other machines in the local network who wants to use that app on the vm.

```bash
ssh -L 8080:localhost:8080 -N -o GatewayPorts=yes dyab@192.168.122.223
```
Now anyone accessing host machine at port 8080 (`192.168.1.7:8080` === `192.168.1.22.223`) TCP will actually talk to localhost:8080 as seen in vm.