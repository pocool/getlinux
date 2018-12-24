echo "system name:"
cat /etc/issue | head -n +1
echo "system bit:"
getconf LONG_BIT
echo "install time"
stat /lost+found/ | grep "Modify"| cut -d":" -f2|cut -c -11
echo "cpu model:"
cat /proc/cpuinfo | grep "name" |cut -d":" -f2|uniq
echo "cpu cores:"
cat /proc/cpuinfo |grep "cpu cores"|cut -d":" -f2 |uniq
echo "memory size:"
free -h | awk '/Mem/ {print $2}'
echo "all disk info:"
df -Th
echo "Internet access  :"
[[ $(curl -o /dev/null --connect-timeout 3 -s -w "%{http_code}" www.baidu.com) -eq 200 ]] && echo yes || echo no
echo "local ip :"
ip addr | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | egrep -v  "^127" | head -n 1
echo "mac address(Default first network card):"
ifconfig |grep HWaddr |head -n 1 | grep -o  "[a-f0-9A-F]\\([a-f0-9A-F]\\:[a-f0-9A-F]\\)\\{5\\}[a-f0-9A-F]"
