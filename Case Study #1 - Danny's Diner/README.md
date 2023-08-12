# Danny's diner case study

[Case study description](https://8weeksqlchallenge.com/case-study-1/)

## Details

The date is loaded into a MySQL database running in a docker container. The queries are written in a CloudBeaver (a cloud IDE) running in another docker container. 

The containers are configured to load the data at initialization in the MySQL database. 

## Scripts

1. [Q01](cb_workspace/GlobalConfiguration/Q01.sql)

2. [Q02](cb_workspace/GlobalConfiguration/Q02.sql)

3. [Q03](cb_workspace/GlobalConfiguration/Q03.sql)

4. [Q04](cb_workspace/GlobalConfiguration/Q04.sql)

5. [Q05](cb_workspace/GlobalConfiguration/Q05.sql)

6. [Q06](cb_workspace/GlobalConfiguration/Q06.sql)

7. [Q07](cb_workspace/GlobalConfiguration/Q07.sql)

8. [Q08](cb_workspace/GlobalConfiguration/Q08.sql)

9. [Q09](cb_workspace/GlobalConfiguration/Q09.sql)

10. [Q10](cb_workspace/GlobalConfiguration/Q10.sql)

11. [Q_BONUS](cb_workspace/GlobalConfiguration/Q_BONUS.sql)

## How to start

- Step 1
  
  ```terminal
  docker compose up -d
  ```

- Step 2
  Head over to [http://localhost:8080]()

- Step 3 
  Click on `Settings` icon at the top left corner and choose login 

- Step 4 
  Use the credentials 
  
  ```
    username: cloudbeaver
    password: 1
  ```

![](\assets\2023-08-12-16-23-58-image.png)

## How to stop

```terminal
docker compose down
```
