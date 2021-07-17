import json
from s3Handler import S3Handler
from env import Variables

def handler(event, context):
    env = Variables()
    s3 = S3Handler(env.get_s3_url())
    
    for record in event['Records']:
        payload = json.loads(json.loads(record["body"])["Message"])
        print('payload {payload}'.format(payload=payload))
        s3.put_object(
                str(payload).encode('utf-8'),
                str('book-id-{id}'.format(id=payload["book_id"])),
            )