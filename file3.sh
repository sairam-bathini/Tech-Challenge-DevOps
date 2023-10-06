#!/bin/bash

###################
# Author: Sairam 
# Date: 06-10-2023
###################

# This script is for a simple-calculator

###################

set -x #debugging mode

read choice

case $choice in
  1)
      # Addition
          echo "Enter the first number: "
	    read num1
	   echo "Enter the second number: "
	   read num2
	   
	   sum=$((num1 + num2))
           echo "The sum is: $sum"
	   ;;
2)
# Subtraction
echo "Enter the first number: "
read num1
echo "Enter the second number: "
read num2
diff=$((num1 - num2))
echo "The difference is: $diff" 
;;



esac

