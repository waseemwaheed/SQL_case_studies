# Danny's diner case study

[Case study description](https://8weeksqlchallenge.com/case-study-2/)

## Details

The date is loaded into a MySQL database running in a docker container. The queries are written in a CloudBeaver (a cloud IDE) running in another docker container. 

The containers are configured to load the data at initialization in the MySQL database. 

## Scripts

All scripts are [here](cb_workspace/GlobalConfiguration/)

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
