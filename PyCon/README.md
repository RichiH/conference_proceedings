PyCon videos are available from http://pyvideo.org/

For some reason, git-annex doesn't deal well with the RSS feeds it
generates however, probably because the enclosure is a link to a Youtube
URL.

So I made up this commandline:

curl -s http://pyvideo.org/category/65/pycon-us-2015/rss | xmllint --xpath '//enclosure/@url' - | sed 's/url=/\n/g' | xargs git annex addurl --fast

It requires:

 * curl
 * xmllint - part of libxml2-utils
 * sed
 * xargs
