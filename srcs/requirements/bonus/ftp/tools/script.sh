#!/bin/bash

service vsftpd start

adduser $ftp_user --disabled-password

echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd
echo "$ftp_user" | tee -a /etc/vsftpd.userlist 

mkdir -p  /home/$ftp_user/ftp/files/
chown -R $ftp_user:$ftp_user /home/$ftp_user/ftp/
chmod 777 /home/$ftp_user/ftp
chmod a-w /home/$ftp_user/ftp

sed -i 's/^#\?write_enable=NO/write_enable=YES/' /etc/vsftpd.conf
sed -i 's/^#\?chroot_local_user=NO/chroot_local_user=YES/' /etc/vsftpd.conf


echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$ftp_user/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd
