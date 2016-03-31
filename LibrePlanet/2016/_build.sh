#!/bin/bash -e

THIS_DIR=${BASH_SOURCE[0]%/*}
BASEURL=http://media.libreplanet.org/u/libreplanet/tag/libreplanet-2016

cd "$THIS_DIR"

wget -O _index.html.new ${BASEURL}/
mv _index.html.new _index.html

for url in $(./_extract_video_urls.py _index.html); do
  git annex addurl --relaxed --pathdepth=-1 "$url"
done
