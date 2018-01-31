baseurl=http://mirror.linux.org.au/pub/linux.conf.au/2018
for day in Monday Tuesday Wednesday Thursday Friday; do
	for room in collab greathall green gutherie largepod medium; do
		url="$baseurl/$room/$day/"
		git annex addurl --pathdepth=-3 --relaxed $(curl $url |grep \.mp4|grep href=|sed 's/.*a href=\"//'|sed 's/".*//' | perl -ne "print q{$url}.\$_") -c  annex.alwayscommit=false
	done
done
