for topdir in OGGB_260098 OGGB_FP OGGB4 OGGB3 Case_Room_3 Case_Room_2; do
	for day in Monday Tuesday Wednesday Thursday Friday Saturday Sunday; do
		mkdir -p $topdir/$day
		(
			cd $topdir/$day
			url=http://mirror.linux.org.au/pub/linux.conf.au/2015/$topdir/$day/
			git annex addurl --relaxed $(curl $url |grep \.webm|grep href=|sed 's/.*a href=\"//'|sed 's/".*//' | perl -ne "print q{$url}.\$_")
		)
	done
done
