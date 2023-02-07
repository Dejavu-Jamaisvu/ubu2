#!/bin/bash

 

. function.sh

 

BAR

CODE [U-16] /dev에 존재하지 않는 device 파일 점검

cat << EOF >> $result  

[양호]: dev에 대한 파일 점검 후 존재하지 않은 device 파일을 제거한 경우

[취약]: dev에 대한 파일 미점검, 또는, 존재하지 않은 device 파일을 방치한 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  



# Define the backup directory
backup_dir="/dev_backup"

# Remove the current /dev directory
rm -rf /dev

# Check if the removal was successful
if [ $? -eq 0 ]; then
  echo "/dev directory removed successfully"
else
  echo "/dev Directory Removal Failed"
  exit 1
fi

# Copy the backup directory to /dev
cp -R $backup_dir /dev

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "$backup_dir directory copied to /dev successfully"
else
  echo "$backup_dir Directory Copy Failed"
  exit 1
fi
 
cat $result

echo ; echo

