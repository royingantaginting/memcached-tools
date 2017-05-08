#!/bin/bash

if [[ "$#" -lt "2" ]]; then
    echo "Usage: $0 [before file] [after file]"
    exit 1
fi

before=$1
after=$2

temp_before=$(mktemp)
temp_after=$(mktemp)

cat $before | awk '{print $1}' | sort > $temp_before
cat $after | awk '{print $1}' | sort > $temp_after
grep -vxF -f $temp_after $temp_before
