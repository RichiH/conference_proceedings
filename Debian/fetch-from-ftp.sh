#!/bin/sh

url=$1

for file in $(curl "$url" | grep 'a href' | grep -v 'Parent Directory' | sed 's/^.*href="//;s/">.*//'); do
    if [ ! -h "$file" ] ; then
        git -c annex.alwayscommit=false annex addurl --relaxed --file "$file" "$url$file"
    fi
done
