In the docker compose file, in volume section:
```d
services:
	solarx-gui:
		container_name: gui
	
		build:
			context: ./frontend-gui
			dockerfile: Dockerfile.dev
		 
		command: npm run start
	
		ports:
			- 3000:3000
		
		volumes:
			- ./frontend-gui/src:/app/src
```

</br>

In the volume section when changing it to track the entire directory not just the source, it gives an error for some reason.
```d
volumes:
	- ./frontend-gui:/app
```


</br>
</br>

------------------------------------------------------------------------
backend container can't connect to kafka with it's name, although they are both in the same network, same docker compose file.
```d
version: '3'

services:
	solarx-backend:
		container_name: backend
		hostname: backend
		
		build:
			context: ./kafka-websocket
			dockerfile: Dockerfile.dev
			
		command: npm run dev
		
		ports:
			- 8000:8000	
			- 
		volumes:
			- ./kafka-websocket/src:/app/src
			
		depends_on:
			- kafka


	kafka:
		image: wurstmeister/kafka
		container_name: kafka
		hostname: kafka
		
		ports:
			- "9092:9092"
		
		environment:
			KAFKA_ADVERTISED_HOST_NAME: kafka
			KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
		
		depends_on:
			- zookeeper
```

> The brokers will advertise themselves using advertised.listeners (which seems to be abstracted with KAFKA_ADVERTISED_HOST_NAME in that docker image) and the clients will consequently try to connect to these advertised hosts and ports.
> 
> You will thus need to make sure the client can resolve and reach this advertised hostnames, e.g. by adding "kafka" to /etc/hosts on the client host.
> 
> https://stackoverflow.com/questions/43103167/failed-to-resolve-kafka9092-name-or-service-not-known-docker-php-rdkafka

</br>

Just needed to add `KAFKA_ADVERTISED_HOST_NAME: kafka`, but then this caused a problem on the host, when connecting to kafka from the host, it can't resolve the `kafka` name to its ip.

</br>

so i had to put a record in the `/etc/hosts` for kafka to point to `localhost`, given that we are exposing the kafka 9092 port to the host.
```bash
[dyab@localhost home]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
127.0.0.1   kafka
```


</br>
</br>

------------------------------------------------------------------------
In the frontend, it doesn't recognize the `backend` name and resolve its ip, although they're both in the same docker compose file, and we know that docker compose file creates a network and connects all the containers -which are in the file- in it.

</br>

Also in the host when we run the frontend through the exposed port between the host and the frontend container, it can't connect to `ws://backend:8080`, this assumes that the `backend` in the same network as the host, but they are not.
so I had to expose the websoket connection ports with the host and add to `/etc/hosts` so that the host can resolve it.

```bash
[dyab@localhost home]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
127.0.0.1   kafka
127.0.0.1	backend
```

Also had to expose the websoket ports of the backend with the host in order for this to work.

```d
version: '3'

services:
	solarx-backend:
		container_name: backend
		hostname: backend
		
		build:
			context: ./kafka-websocket
			dockerfile: Dockerfile.dev
			
		command: npm run dev
		
		ports:
			- 8000:8000
			- 8080:8080
			- 9090:9090
			- 9191:9191
			
		volumes:
			- ./kafka-websocket/src:/app/src
			
		depends_on:
			- kafka
```