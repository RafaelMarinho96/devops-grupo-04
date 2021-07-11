# DevOps and CloudOps

### Passo a passo

#### State

```sh
cd ./state
```

Create S3, Run:

1. `cd ./s3`.
2. `terraform init && terraform apply -auto-approve`.

Now create State, Run:

1. `cd ../state`
2. `terraform init && terraform apply -auto-approve`.

### SNS

```sh
cd ./sns
```

Create sns:

1. `terraform init && terraform apply -auto-approve`.

### SQS

```sh
cd ./sqs
```
Create sqs:

1. `terraform init && terraform apply -auto-approve`.

### API Gateway && Book lambdas

```sh
cd ./api-gateway
```

Create API gateway with lambdas

1. `sls create --template=aws-python3`.
2. `mv base.yml serveless.yml`.
3. `sls deploy`.
