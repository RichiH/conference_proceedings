#!/bin/sh

set -e

git annex addurl --pathdepth=-1 --relaxed \
	$(curl https://archive.org/download/hopeconf2020 | grep \.mp4 | \
		grep href=|sed 's/.*a href=\"//'|sed 's/".*//' | \
		perl -ne 'print "https://archive.org/download/hopeconf2020/" . $_')
