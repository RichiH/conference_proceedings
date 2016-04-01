for topdir in 01_Monday 02_Tuesday 03_Wednesday 04_Thursday 05_Friday; do
	for room in Costa_Hall D2.193_Percy_Baxter D2.194_Next_to_Percy_Baxter D2.211 D4.303_Costa_Theatre Wool_Museum; do
		mkdir -p $topdir/$room
		(
			cd $topdir/$room
			url=http://mirror.linux.org.au/pub/linux.conf.au/2016/$topdir/$room/
			git annex addurl --pathdepth=-1 --relaxed $(curl $url |grep \.webm|grep href=|sed 's/.*a href=\"//'|sed 's/".*//' | perl -ne "print q{$url}.\$_") -c  annex.alwayscommit=false
		)
	done
done
