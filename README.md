# Meteor Docker Deploy


## 安装Docker

``` bash
cd scripts
./deploy_docker.sh AppServerIP
```

## 构建mdd镜像

``` bash
cd image
./build_image.sh AppServerIP
```

## 安装Mongo

``` bash
cd scripts
./deploy_mongo.sh MongoIP
```

## 部署App

``` bash
cd meteorapp
./deploy_app.sh AppServerIP MongoIP
```
