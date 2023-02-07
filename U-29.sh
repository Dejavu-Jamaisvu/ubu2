#!/bin/bash

. function.sh

BAR

CODE [U-29] tftp, talk 서비스 비활성화		

cat << EOF >> $result

[양호]: tftp, talk, ntalk 서비스가 비활성화 되어 있는 경우

[취약]: tftp, talk, ntalk 서비스가 활성화 되어 있는 경우

EOF

BAR



# Backup files
cp /etc/xinetd.d/tftp /etc/xinetd.d/tftp.bak
cp /etc/xinetd.d/talk /etc/xinetd.d/talk.bak
cp /etc/xinetd.d/ntalk /etc/xinetd.d/ntalk.bak



# tftp 파일 생성
echo "service tftp
{
socket_type = dgram
protocol = udp
wait = yes
user = root
server = /usr/sbin/in.tftpd
server_args = -s /tftpboot
disable = yes
}" > /etc/xinetd.d/tftp

# talk 파일 생성
echo "service tftp
{
socket_type = dgram
protocol = udp
wait = yes
user = root
server = /usr/sbin/in.tftpd
server_args = -s /tftpboot
disable = yes
}" > /etc/xinetd.d/talk

# ntalk 파일 생성
echo "service tftp
{
socket_type = dgram
protocol = udp
wait = yes
user = root
server = /usr/sbin/in.tftpd
server_args = -s /tftpboot
disable = yes
}" > /etc/xinetd.d/ntalk


cat $result

echo ; echo
