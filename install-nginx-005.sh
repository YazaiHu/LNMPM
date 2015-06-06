#!/bin/bash
install_path=`pwd`

echo 'INSTALL NGINX SERVICE BEGINNING .........................'
#install Nginx Service
yum install -y --enablerepo=epel nginx

mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.disabled
if [ $? != 0 ]
then
	echo '备份Nginx.conf文件失败'
	exit
fi

mv /etc/nginx/conf.d /etc/nginx/conf.d.disabled
if [ $? != 0 ]
then
	echo '备份Nginx conf.d 文件夹失败'
	exit
fi

cp $install_path/nginx/nginx.conf /etc/nginx
if [ $? != 0 ]
then
	echo '变更nginx.conf 文件失败'
	exit
fi

cp -r $install_path/nginx/conf.d /etc/nginx
if [ $? != 0 ]
then
	echo '变更Nginx conf.d 文件夹失败'
	exit
fi

cp $install_path/nginx/upstream.conf /etc/nginx
if [ $? != 0 ]
then
	echo '变更Nginx upstream.conf  文件夹失败'
	exit
fi

mkdir -p /var/log/nginx
if [ $? != 0 ]
then
	echo '创建Nginx 日志文件夹失败'
	exit
fi

#start service nginx 
service nginx start
if [ $? != 0 ]
then
	echo 'Nginx 服务启动失败'
	exit
fi

echo 'INSTALL NGINX SERVICE OK .............................'
