import boto3

class S3Handler:
    def __init__(self, s3_url):
        self.__s3 = boto3.client('s3')
        self.__s3_url = s3_url

    def put_object(self, body, key):
        boto3.client('s3').put_object(
            Body=body,
            Bucket=self.__s3_url,
            Key=key
        )