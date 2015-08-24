#!/bin/sh

YEAR="$1"
BASE_URL="http://files.kde.org/akademy/$YEAR/videos/"

mkdir $YEAR
cd $YEAR

curl -s $BASE_URL.message -o LICENSE && git add LICENSE

curl -s $BASE_URL | xmllint --html --xpath '//a/@href' - | \
    sed 's/href=/\n/g' | grep -e '\(webm\|mp4\|m4v\|ogv\)"' | \
    cut -d\" -f 2 | \
    sed "s#^#$BASE_URL#" | \
    xargs -d '\n' -n 1 git annex addurl --relaxed --pathdepth=-1
