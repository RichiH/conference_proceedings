#!/bin/bash -e

THIS_DIR=${BASH_SOURCE[0]%/*}

cd "$THIS_DIR"

wget -O _index.html.new http://media.libreplanet.org/u/libreplanet/tag/lp2015/
mv _index.html.new _index.html

for url in $(./_extract_video_urls.py _index.html); do
  git annex addurl --relaxed --pathdepth=-1 "$url"
done
