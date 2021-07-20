# DevOps and CloudOps

### Step by Step

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


### BUCKET S3

```sh
cd ./bucket
```
Create S3:

1. `terraform init && terraform apply -auto-approve`.


### API Gateway && Book lambdas

```sh
cd ./api-gateway
```

#### Version required:

Framework Core: 2.45.2
Plugin: 5.3.0
SDK: 4.2.3
Components: 3.12.0

Create API gateway with lambdas

1. `sls deploy --config serverless.yml`.

#### Request on postman

**URL:**
*{{generatedUrlFromServeless}}/book/create *

**METHOD:**
*POST*

**BODY**
```
{
    "book_name": "Comece pelos Porques",
    "book_id": "123",
    "book_price": 45.87
}
```

**URL:**
*{{generatedUrlFromServeless}}/sell/book *

**METHOD:**
*POST*


**BODY**
```
{
    "book_id": "123",
    "customer_id": 45.87
}
```


#### Tricks:

**Seeing logs:**
1. `sls logs -f sellbook --config serverless.yml`.

#### troubleshoot

**How to solve BucketAlreadyExists:**
```Error creating S3 bucket: BucketAlreadyExists:```

##### State 

1. cd ./state/s3
2. c9 open s3.tf
3. Change bucket name in this line:
```bucket = '{{bucket_name}}' // [Troubleshoot] Update bucket name```

##### Bucket 

1. cd ./bucket
2. c9 open s3.tf
3. Change bucket name in this line:
```bucket = '{{bucket_name}}' // [Troubleshoot] Update bucket name```

##### API Gateway 

1. cd ./api-gateway
2. c9 open serverless.yaml
3. Change bucket name in this line:
```s3_url: 'lab-fiap-78aoj-grupo-04-bucket-book' # [Troubleshoot] Update bucket name```