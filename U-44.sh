#!/bin/bash

. function.sh

BAR

CODE [U-44] root 이외의 UID가 ‘0’ 금지

cat << EOF >> $result

[양호]: root 계정과 동일한 UID를 갖는 계정이 존재하지 않는 경우

[취약]: root 계정과 동일한 UID를 갖는 계정이 존재하는 경우

EOF

BAR

# Save Current Date and Time
current_date_time=$(date +"%Y-%m-%d %T")

# Make a backup of the /etc/passwd file
cp /etc/passwd /etc/passwd_$current_date_time

# Gets the user name of an account with the same UID as the root account
username=$(awk -F: '$3==0{print $1}' /etc/passwd)

if [ -n "$username" ]; then
  # UID Array
  uids=(2023 2024 2025)

  for uid in "${uids[@]}"; do
    # Change the UID of an account
    sudo usermod -u $uid $username
  done
else
  OK "An account with the same UID as the root account cannot be found"
fi


cat $result

echo ; echo