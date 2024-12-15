We have a total of 3 envs....

1- under `mysql_database`
```env
DATABASE_USER='solarx'
DATABASE_PASSWORD='password'
DATABASE_HOST='solarx-db'
DATABASE_NAME='SolarX'
DATABASE_PORT='3306'
KAFKA_BROKER_ADDRESS="kafka:9092" 
```


2- under `kafka-websocket`
```env
BROKER_HOST='kafka'
```


3- under `frontend-gui`
```env
REACT_APP_WS1_URL="ws://localhost:4000/ws1/"
REACT_APP_WS2_URL="ws://localhost:4000/ws2/"
REACT_APP_WS3_URL="ws://localhost:4000/ws3/"
```

4- under `solar-x` the root
```env
KAFKA_BROKER_ADDRESS="kafka:9092"
```

for react the envs have to start with `REACT_APP`.
