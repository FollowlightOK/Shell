#!/bin/bash
#Use for collect information

PS3="Please input your choice: "
sys_check ()
{ 
if [ -e /etc/redhat-release ];then
  sys=`cat /etc/redhat-release | cut -d ' ' -f1`
  echo "Linux system is $sys"
else
  sys=`cat /etc/issue | cut -d ' ' -f1`
  echo "Linux system is $sys"
fi

if [ "$sys" == "CentOS" -o "$sys" == "Red" ];then
  pm=yum
  echo "Manage packege order is $pm"
elif  [ "$sys" == "Ubuntu" -o "$sys" == "ubutun" ];then
  pm=apt-get
  echo "Manage packege order is $pm"
else
  echo "Operate system is not exist"
  exit 1
fi 
}

#Judge command exist
if [ "$USER" != "root" ];then
 echo "You are not root please change owner!!!"
 exit 1
fi
if ! which iostat &>/dev/null;then
echo "The command is not install now is installing"
sleep 1
 sys_check
 $pm install sysstat -y
 echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
fi


#menu
while true; do
 select input in cpu_load disk_load quit; do
 case "$input" in
 cpu_load)
   free -m 
   break
  ;;
 disk_load)
   df -h
  break
 ;;
  quit)
 exit
 ;;
  *)
 exit
 esac
done
done

