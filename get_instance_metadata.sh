#!/bin/bash

##################################

# Author: Sairam Bathini
# Date: 10-10-2023

# Script: Meta Date of any Instance

##################################

# Function to get the value of a specific key from instance metadata
get_instance_metadata() {
local key="$1"
local value=$(curl -s http://169.254.169.254/latest/meta-data/$key)
echo "{ \"$key\": \"$value\" }"
}
	    
# Usage
key="instance-id"
metadata_json=$(get_instance_metadata $key)
echo $metadata_json

		
