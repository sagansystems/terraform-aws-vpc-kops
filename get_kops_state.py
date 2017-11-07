#!/usr/bin/python
import json
import sys

import logging
import subprocess

log_level = logging.INFO

class Bridge:

	def __init__(self):
		logging.basicConfig(filename='tf_aws_vpc_kops.log', level=log_level)

	def getVpcId(self, cluster_name):		
		#kops_json_string = subprocess.check_output(["kops", "toolbox", "dump", "--name", cluster_name, '-o', 'json'])		
		with open('kops.json') as data_file:
			kops_json  = json.load(data_file) 
		#logging.info(kops_json_string)
		# convert string to python map
		#kops_json = json.loads(kops_json_string)

		# get the vpc object
		for resource in kops_json['resources']:
			if resource['type'] == "vpc":
				return resource['id']

	def outputVpcId(self, vpc_id):
		print json.dumps({"vpc_id": vpc_id}, sort_keys=True)

def main():	
	data = json.load(sys.stdin)
	cluster_name = data['cluster']
	bridge = Bridge()
	vpc_id = bridge.getVpcId(cluster_name)
	bridge.outputVpcId(vpc_id)

if __name__== "__main__":
	main()