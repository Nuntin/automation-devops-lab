#!/usr/bin/env python3

import boto3
import json

ec2 = boto3.client('ec2')
response = ec2.describe_instances(Filters=[
    {'Name': 'tag:Name', 'Values': ['devops-ec2']}
])

instances = []
for r in response['Reservations']:
    for i in r['Instances']:
        if i.get('PublicIpAddress'):
            instances.append(i['PublicIpAddress'])

inventory = {
    "all": {
        "hosts": instances,
        "vars": {
            "ansible_user": "ubuntu",
            "ansible_ssh_private_key_file": "~/.ssh/id_rsa"
        }
    }
}

print(json.dumps(inventory, indent=2))
