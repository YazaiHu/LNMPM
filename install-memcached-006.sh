#!/bin/bash
install_path=`pwd`

echo 'INSTALL MEMCACHED SERVICE BEGINNNIG .................'
#install memcached 
yum install -y memcached

mv /etc/sysconfig/memcached /etc/sysconfig/memcached.disabled 
if [ $? != 0 ]
then
	echo '备份/etc/sysconfig/memcached 文件失败'
	exit
fi

cp -f $install_path/memcached /etc/sysconfig
if [ $? != 0 ]
then
	echo '变更/etc/sysconfig/memcached文件失败'
	exit
fi

#start memcached service
service memcached start
if [ $? != 0 ]
then
	echo 'memcached 服务启动失败'
	exit
fi
