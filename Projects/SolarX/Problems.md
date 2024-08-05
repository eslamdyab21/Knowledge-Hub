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

In the volume section when changing it to track the entire directory not just the source, it gives an error for some reason.
```d
volumes:
	- ./frontend-gui:/app
```


------------------------------------------------------------------------
backend container can't connect to kafka with it's name, although they are both in the same network, same docker compose file.
```
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


Just needed to add `KAFKA_ADVERTISED_HOST_NAME: kafka`, but then this caused a problem on the host, when connecting to kafka from the host, it can't resolve the `kafka` name to its ip.

so i had to put a record in the `/etc/hosts` for kafka to point to `localhost`, given that we are exposing the kafka 9092 port to the host.
```
[dyab@localhost home]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
127.0.0.1   kafka
```