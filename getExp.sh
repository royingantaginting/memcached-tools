#!/bin/bash

if [[ "$#" -lt "2" ]]; then
    echo "Usage: $0 [source file] [pattern]"
    exit 1
fi

file=$1
pattern=$2

cat $file | grep "$pattern" | awk '{print $2}' | cut -c 5-
