#!/bin/bash

. function.sh

BAR

CODE [U-22] crond 파일 소유자 및 권한 설정

cat << EOF >> $result

[양호]: crontab 명령어 일반사용자 금지 및 cron 관련 파일 640 이하인 경우

[취약]: crontab 명령어 일반사용자 사용가능하거나, crond 관련 파일 640 이상인 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Backup files
cp /etc/crontab /etc/crontab.bak
cp /etc/cron.hourly /etc/cron.hourly.bak 
cp /etc/cron.daily /etc/cron.daily.bak
cp /etc/cron.weekly /etc/cron.weekly.bak 
cp /etc/cron.monthly /etc/cron.monthly.bak 
cp /etc/cron.allow /etc/cron.allow.bak 
cp /etc/cron.deny /etc/cron.deny.bak 
cp /var/spool/cron/* /var/spool/cron/*.bak
#cp /var/spool/cron/crontabs/* /var/spool/cron/crontabs/*.bak



files=(/etc/crontab /etc/cron.hourly /etc/cron.daily /etc/cron.weekly /etc/cron.monthly /etc/cron.allow /etc/cron.deny /var/spool/cron/ /var/spool/cron/crontabs/)

for file in "${files[@]}"
do
  chown root:root $file
  chmod 640 $file
done

cat $result

echo ; echo