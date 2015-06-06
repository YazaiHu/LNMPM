#!/bin/sh
#注意先修改my.cnf里参数bind-address 监听IP
install_path=`pwd`
listen_ip='127.0.0.1'

echo 'INSTALL MYSQL SERVICE BEGINNING ......................'

yum install -y --enablerepo=remi  mysql-libs mysql-devel  mysql mysql-server

if [ $? != 0 ]
then
	echo 'install mysql service failed';
	exit
fi

#创建mysql服务所需要的目录，并设置权限mysql用户拥有
mkdir -p /opt/data/mysql && chown -R mysql:mysql /opt/data/mysql
mkdir -p /var/log/mysql && chown -R mysql:mysql /var/log/mysql

#改变mysql初始化数据库数据存放路径
mysql_install_db --user=mysql --datadir=/opt/data/mysql

#替换默认的mysql配置文件
mv /etc/my.cnf /etc/my.cnf.disabled
if [ $? != 0 ]
then
	echo '移除MYSQL默认配置文件失败'
	exit
fi

cp $install_path/my.cnf /etc/
if [ $? != 0 ]
then
	echo '替换MYSQL默认配置文件失败'
	exit
fi

sed -i "s/LISTENIP/${listen_ip}/" /etc/my.cnf

#start mysql service
service mysqld start
if [ $? != 0 ]
then
	echo '启动MYSQL服务失败'
	exit
fi

echo 'INSTALL MYSQL SERVICE BEGINNING OK ............................'
