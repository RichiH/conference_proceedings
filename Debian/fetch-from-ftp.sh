#!/bin/sh

set -e

url=$1

for file in $(curl "$url" | grep 'a href' | grep -v 'Parent Directory' | sed 's/^.*href="//;s/">.*//'); do
    if [ ! -h "$file" ] ; then
        git annex addurl --relaxed --file "$file" "$url$file"
    fi
done
