from sqsHandler import SqsHandler
from env import Variables

def handler(event, context):
    env = Variables()
    sqs = SqsHandler(env.get_sqs_url())
    sqsDest = SqsHandler(env.get_sqs_url_dest())
    
    for i in range(100):
        msgs = sqs.getMessage(10)
        print(str(msgs))
        if('Messages' not in msgs):
            break
        if(len(msgs['Messages']) == 0):
            break
        
        for msg in msgs['Messages']:
            sqsDest.send(str(msg['Body']))
            sqs.deleteMessage(msg['ReceiptHandle'])