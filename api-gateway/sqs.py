import json
from s3Handler import S3Handler
from env import Variables
from build_key import build_key

def handler(event, context):
    env = Variables()
    s3 = S3Handler(env.get_s3_url())
    
    for record in event['Records']:
        payload = json.loads(json.loads(record["body"])["Message"])
        print('payload {payload}'.format(payload=payload))
        s3.put_object(
                str(payload).encode('utf-8'),
                build_key(payload["book_id"], payload.get("book_name", ''), payload.get("customer_id")),
            )