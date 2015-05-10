#!/bin/bash -e

cd ${BASH_SOURCE[0]%/*}

BASEURL=http://meetings-archive.debian.net/pub/debian-meetings/2015/mini-debconf-lyon

wget -O index.html.new $BASEURL/
mv index.html{.new,}

for i in `grep 'href=".[^"]*"' index.html | cut -f 6 -d '"' | grep webm | sed -e 's/[%:,-]/_/g'`; do
  git annex addurl --relaxed $BASEURL/$i --file "$i"
done

slides/build.sh
