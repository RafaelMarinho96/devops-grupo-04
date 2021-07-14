from sqsHandler import SqsHandler
from s3Handler import S3Handler
from env import Variables

def handler(event, context):
    env = Variables()
    sqs = SqsHandler(env.get_sqs_url())
    s3 = S3Handler(env.get_s3_url())
    
    for i in range(100):
        msgs = sqs.getMessage(10)
        print(str(msgs))
        if('Messages' not in msgs):
            break
        if(len(msgs['Messages']) == 0):
            break
        
        for msg in msgs['Messages']:
            s3.put_object(
                str(msg['Body']).encode('utf-8'),
                msg['Body']['book_id'],
            )
            sqs.deleteMessage(msg['ReceiptHandle'])