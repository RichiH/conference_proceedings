#!/bin/bash -e

THIS_DIR=${BASH_SOURCE[0]%/*}
BASEURLS=( http://media.libreplanet.org/u/libreplanet/tag/{lp,libreplanet-}2016 )

cd "$THIS_DIR"

for baseurl in ${BASEURLS[@]}; do
  wget -O _index.html.new ${baseurl}/
  mv _index.html.new _index.html

  for url in $(./_extract_video_urls.py _index.html); do
    git annex addurl --relaxed --pathdepth=-1 "$url"
  done
done
