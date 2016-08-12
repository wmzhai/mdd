# Meteor Docker Deploy


## 安装Docker

``` bash
./deploy_docker.sh AppServerIP
```

## 构建mdd镜像

``` bash
cd image
./build_image.sh AppServerIP
```

## 安装Mongo

``` bash
./deploy_mongo.sh MongoIP
```

## 部署App

``` bash
cd meteorapp
vi settings # edit your settings
./deploy.sh
```
