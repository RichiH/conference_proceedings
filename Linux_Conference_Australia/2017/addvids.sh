url=http://mirror.linux.org.au/pub/linux.conf.au/2017/
git annex addurl --relaxed $(curl $url |grep \.webm|grep href=|sed 's/.*a href=\"//'|sed 's/".*//' | perl -ne "print q{$url}.\$_") -c  annex.alwayscommit=false
