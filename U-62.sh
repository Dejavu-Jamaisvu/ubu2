#!/bin/bash

 

. function.sh
 

BAR

CODE [U-62] ftp 계정 shell 제한

cat << EOF >> $result

[양호]: ftp 계정에 /bin/false 쉘이 부여되어 있는 경우

[취약]: ftp 계정에 /bin/false 쉘이 부여되지 않 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1 

# Restore backup files
cp /etc/passwd /etc/passwd.bak


# /etc/passwd 파일에서 FTP 계정의 항목을 가져옵니다
ftp_entry=$(grep "^ftp:" /etc/passwd)

# FTP 계정의 셸을 /bin/false로 바꿉니다
new_entry=$(echo $ftp_entry | sed 's#\(.*\):.*:\(.*\)#\1:/bin/false:\2#')

# /etc/passwd 파일에 새 항목 쓰기
sudo sed -i "s#^ftp:.*#$new_entry#" /etc/passwd

# FTP 계정의 셸을 확인하여 변경 사항 확인
ftp_shell=$(grep "^ftp:" /etc/passwd | awk -F: '{print $7}')
if [ "$ftp_shell" == "/bin/false" ]; then
  OK "FTP 계정의 셸이 /bin/false로 설정되었습니다."
else
  INFO "FTP 계정의 셸을 /bin/false로 설정할 수 없습니다."
fi




cat $result

echo ; echo 

 
