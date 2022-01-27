import os
import json
import boto3
import uuid
import csv
import codecs

s3_client = boto3.client('s3')
dynamodb = boto3.resource('dynamodb')
dynamodbtable = os.environ['DynamoDBTable']
table = dynamodb.Table(dynamodbtable)
csvrecords = []
def lambda_handler(event, context):
    bucket_name = event["Records"][0]["s3"]["bucket"]["name"]
    s3_file_name = event["Records"][0]["s3"]["object"]["key"]
    resp = s3_client.get_object(Bucket=bucket_name, Key=s3_file_name)
    data = resp['Body'].read().decode('utf-8')
    csvrecords = data.split("\n")
    records = len(list(csvrecords))


    for record in range(1, records-1) :
        record_split = csvrecords[record].split(',')
        print(record_split[1])
        response = table.put_item(
                        Item = {
                            'ID': str(record_split[0]),
                            'Name': record_split[1],
                            'Sex': record_split[2],
                            'Age': record_split[3],
                            'Height': record_split[4],
                            'Weight': record_split[5]
                            })
        print(response)
