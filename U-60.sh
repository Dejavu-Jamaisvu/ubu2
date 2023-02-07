#!/bin/bash

 

. function.sh

  
 

BAR

CODE [U-60] ssh 원격접속 허용

cat << EOF >> $result

[양호]: 원격 접속 시 SSH 프로토콜을 사용하는 경우

[취약]: 원격 접속 시 Telnet, FTP 등 안전하지 않은 프로토콜을 사용하는 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1  

# 백업 파일

# Check if Telnet is installed and backup its configuration, if any
if dpkg -s telnet &> /dev/null; then
    sudo cp -R /etc/telnet /etc/telnet.bak
fi

# Check if FTP is installed and backup its configuration, if any
if dpkg -s ftp &> /dev/null; then
    sudo cp -R /etc/ftp /etc/ftp.bak
fi

# Backup ssh configuration
sudo cp -R /etc/ssh /etc/ssh.bak





# Remove Telnet, if installed
sudo apt-get remove telnet -y #추가한 부분

# Remove FTP, if installed
sudo apt-get remove ftp -y #추가한 부분

# Install ssh
sudo apt-get install openssh-server -y

# Start ssh service
sudo service ssh start



sudo systemctl enable ssh

systemctl status ssh



cat $result

echo ; echo 
