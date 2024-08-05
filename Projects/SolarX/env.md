We have a total of 3 envs....

1- under `mysql_database`
```env
DATABASE_USER='root'
DATABASE_PASSWORD='password'
DATABASE_HOST='localhost'
DATABASE_NAME='SolarX'
DATABASE_PORT='3306'   
```


2- under `kafka-websocket`
```env
BROKER_HOST='kafka'
```


3- under `frontend-gui`
```env
REACT_APP_WS1_URL="ws://backend:8080"
REACT_APP_WS2_URL="ws://backend:9090"
REACT_APP_WS3_URL="ws://backend:9191"
```
for react the envs have to start with `REACT_APP`.