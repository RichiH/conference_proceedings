baseurl=http://mirror.linux.org.au/pub/linux.conf.au/2021
for room in blemings_labs pia_andrews_conservatory rusty_r_hall tux_theatre; do
	for day in Monday Tuesday Wednesday Thursday Friday Saturday Sunday; do
		url="$baseurl/$room/$day/"
		git annex addurl --pathdepth=-3 --relaxed $(curl $url |grep \.webm|grep href=|sed 's/.*a href=\"//'|sed 's/".*//' | perl -ne "print q{$url}.\$_") -c  annex.alwayscommit=false
	done
done
