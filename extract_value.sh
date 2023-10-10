#!/bin/bash

#######################################
# Author:Sairam Bathini
# Date: 10-10-2023

# Scirpt: Nested Object Value Retrieval
########################################
# Define a recursive function to extract a value from a nested object

function extract_value {

local obj="$1"
local key="$2"

# Split the key into an array based on '/'

IFS="/" read -ra keys <<< "$key"

# Iterate through the keys and navigate the object

for k in "${keys[@]}"; do
if [ -z "$obj" ]; then
break
fi
obj=$(echo "$obj" | jq -r ".$k")
done

# Print the final value

echo "$obj"
}

# Example Input

object1='{"a":{"b":{"c":"d"}}}'
key1="a/b/c"

object2='{"x":{"y":{"z":"a"}}}'
key2="x/y/z"

# Call the function with the examples

result1=$(extract_value "$object1" "$key1")
result2=$(extract_value "$object2" "$key2")

# Print the results

echo "Value for $key1: $result1"
echo "Value for $key2: $result2"




