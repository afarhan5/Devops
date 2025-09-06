#!/bin/bash

template_file="$1"
shift

# Read all key=value pairs into associative array
declare -A kv_pairs
for pair in "$@"; do
    key="${pair%%=*}"
    value="${pair#*=}"
    kv_pairs["$key"]="$value"
done

# Read and replace
while IFS= read -r line; do
    for key in "${!kv_pairs[@]}"; do
        line="${line//\{\{$key\}\}/${kv_pairs[$key]}}"
    done
    echo "$line"
done < "$template_file"
