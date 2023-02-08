#!/bin/bash

. function.sh

BAR

CODE [U-47] 패스워드 최대 사용기간 설정

cat << EOF >> $result

[양호]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있는 경우

[취약]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있지 않는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Get the current date and time to use as the backup file name
current_date_time="$(date +%Y-%m-%d_%H-%M-%S)"

# Create the backup file with the current date and time in the file name
sudo cp /etc/login.defs "/etc/login.defs_backup_$current_date_time"

echo "Backup of /etc/login.defs created at /etc/login.defs_backup_$current_date_time"

sudo sed -i "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS\ 90/" /etc/login.defs


cat $result

echo ; echo