import os

class Variables:
    def __init__(self):
        self.__sqs_url = os.environ.get('sqs_url', '')
        self.__s3_url = os.environ.get('s3_url', '')

    def get_sqs_url(self):
        return self.__sqs_url
    
    def get_s3_url(self):
        return self.__s3_url