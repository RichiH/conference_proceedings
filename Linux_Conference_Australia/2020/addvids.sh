baseurl=http://mirror.linux.org.au/pub/linux.conf.au/2020
for day in Monday Tuesday Wednesday Thursday Friday; do
	for room in arena room_5 room_6 room_7 room_8 room_9; do
		url="$baseurl/$room/$day/"
		git annex addurl --pathdepth=-3 --relaxed $(curl $url |grep \.webm|grep href=|sed 's/.*a href=\"//'|sed 's/".*//' | perl -ne "print q{$url}.\$_") -c  annex.alwayscommit=false
	done
done
