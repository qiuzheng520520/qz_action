#!/bin/bash

send_dingding()
{
   curl -X POST 'https://oapi.dingtalk.com/robot/send?access_token=a4d671062097416631a5ecee16cff119a0559a8b733340a9d3ede39daa46a0eb' -H 'Content-Type: application/json' -d "{\"msgtype\": \"text\",\"text\": {\"content\":\"action\n $1\"}}"
}


vm_status()
{
    date_t=$(date)
	release_t=$(cat /etc/*release* | sed -n 1p)
	user_t=$(whoami)
	cpu_t=$(cat /proc/cpuinfo | grep processor | wc -l)
    mem_t=$(free -h | sed -n 2p)
	disk_t=$(df -h | egrep ^/ | sed -n 1p)
	ip_t=$(curl -s cip.cc | sed -n 1p)
	send_dingding "$date_t\n$release_t\n user: $user_t\n cpu: $cpu_t\n$mem_t\n$disk_t\n$ip_t\n"
}


vm_status

