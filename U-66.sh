#!/bin/bash

 

. function.sh
   

BAR

CODE [U-66] SNMP 서비스 구동 점검

cat << EOF >> $result

[양호]: SNMP 서비스를 사용하지 않는 경우

[취약]: SNMP 서비스를 사용하는 경우

EOF

BAR

# snmpd 구성 파일 백업
sudo cp /etc/sudiod.conf /etc/sudiod.conf.bak

# snmpd 서비스 중지
sudo service snmpd stop

cat $result

echo ; echo
 

