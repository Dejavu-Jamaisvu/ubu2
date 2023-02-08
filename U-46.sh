#!/bin/bash

. function.sh

BAR

CODE [U-46] 패스워드 최소 길이 설정

cat << EOF >> $result

[양호]: 패스워드 최소 길이가 8자 이상으로 설정되어 있는 경우 

[취약]: 패스워드 최소 길이가 8자 미만으로 설정되어 있는 경우 

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Get the current date and time to use as the backup file name
current_date_time="$(date +%Y-%m-%d_%H-%M-%S)"

# Create the backup file with the current date and time in the file name
sudo cp /etc/login.defs "/etc/login.defs_backup_$current_date_time"

echo "Backup of /etc/login.defs created at /etc/login.defs_backup_$current_date_time"

# PASS_MIN_LEN 값을 8 이상으로 설정합니다
echo "PASS_MIN_LEN 8" | sudo tee -a /etc/login.defs


cat $result

echo ; echo