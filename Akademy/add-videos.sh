#!/bin/sh

YEAR="$1"
BASE_URL="${2:-http://files.kde.org/akademy/$YEAR/videos/}"

mkdir -p $YEAR
cd $YEAR

curl -s $BASE_URL.message -o LICENSE && git add LICENSE

urls=`curl -s $BASE_URL | xmllint --html --xpath '//a/@href' - | \
          sed 's/href=/\n/g' | grep -e '\(webm\|mp4\|m4v\|ogv\)"' | \
          cut -d\" -f 2 | \
          sed "s#^#$BASE_URL#"`

for url in $urls; do
  file=`echo $url | sed -e 's,.*/,,' -e 's/%20/_/g' -e 's/&amp;/_/g' -e 's/%c5%a1/s/g' -e 's/%c3%a4/ae/g' -e 's/%c3%9f/ss/g' -e 's/%c5%88/n/g' -e 's/%c3%a1/a/g' -e "s/[,()'+-]/_/g"`
  git annex addurl --relaxed --file=$file $url
done
