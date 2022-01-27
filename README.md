# monorepo


This repo consists of three components:

### infrastructure:
This is completely in terraform following a modular structure to create the infra for serverless app and container app.

### serverless application
Simple python lambda which writes to dynamo when a CSV is uploaded to bucket.

### container application
Simple flask app which can calculate factorial of a number.



## Deployments
#### Serverless app
For deploying Lambda function run `terrafom apply -target module.serverless_app`
Once deployed you can upload the CSV file in the bucket created.

#### Container app
For deploying docker build the container with the following steps

```
docker build . -t containerapp:latest ## from the root of serverless_app directory

docker tag containerapp:latest 560276875947.dkr.ecr.eu-west-1.amazonaws.com/container-app:latest ## repo name can be obtained from terraform output ecr_repo in the infrastructure directory.

aws ecr --profile testget --region eu-west-1 get-login-password | docker login --username AWS --password-stdin 560276875947.dkr.ecr.eu-west-1.amazonaws.com/container-app:latest ## use this to authenticate with ECS

docker push 560276875947.dkr.ecr.eu-west-1.amazonaws.com/container-app:latest
```
