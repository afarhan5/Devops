#!/bin/bash

# Input: a number
number=$1

# Check divisibility and print accordingly
if ((number % 15 == 0)); then
    echo "tomcat"
elif ((number % 3 == 0)); then
    echo "tom"
elif ((number % 5 == 0)); then
    echo "cat"
else
    echo ""
fi
