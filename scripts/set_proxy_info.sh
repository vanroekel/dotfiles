#########################################################################################
#			Set Info for Mounting and Aliasing to Desktop at home						#
#########################################################################################
ATWORK_DOMAIN='.lanl.gov'
WORKIP="no"

alias ifconfig='/sbin/ifconfig'

OS=`uname`
IO="" # store IP
case $OS in
	Linux) IP=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`;;
	FreeBSD|OpenBSD|Darwin) IP=`ifconfig  | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}'` ;;
	SunOS) IP=`ifconfig -a | grep inet | grep -v '127.0.0.1' | awk '{print $2} '` ;;
	*) IP="Unknown";;
esac

IPS=`echo $IP | tr " " "\n"`

for IP in $IPS
do
    DOMAIN=`nslookup ${IP} | grep "${ATWORK_DOMAIN}"`

    if [ -n "${DOMAIN}" ]; then
        WORKIP="yes"
    fi
done

case $WORKIP in
 	"yes") export http_proxy="http://proxyout.lanl.gov:8080"
 		#export https_proxy="https://proxyout.lanl.gov:8080"
 		export ftp_proxy="http://proxyout.lanl.gov"
 		export no_proxy="*.lanl.gov"
 		#cp ~/.subversion/servers.lanl ~/.subversion/servers
 		#cp /etc/apt/apt.conf.lanl /etc/apt/apt.conf
 		git config --global http.proxy $http_proxy
		#gconftool-2 -t string -s /system/proxy/mode "manual"
		#gconftool-2 -t string -s /system/http_proxy/host "127.0.0.1"
		#gconftool-2 -t int -s /system/http_proxy/port 23000
		#gconftool-2 -t bool -s /system/http_proxy/use_http_proxy true
		#cp ~/.purple/prefs.xml.lanl ~/.purple/prefs.xml
 		;;
 	*) unset http_proxy
 		unset https_proxy
 		unset ftp_proxy
 		unset no_proxy
		unset all_proxy
		#cp ~/.subversion/servers.nolanl ~/.subversion/servers
 		#cp /etc/apt/apt.conf.nolanl /etc/apt/apt.conf
 		git config --global http.proxy ""
		#gconftool-2 -t string -s /system/proxy/mode "none"
		#gconftool-2 -t bool -s /system/http_proxy/use_http_proxy false
		#cp ~/.purple/prefs.xml.nolanl ~/.purple/prefs.xml
 		;;
esac

