#!/bin/sh
echo '安装系统依赖包开始。。。。。。。。。。。。。。。。。。'

echo 'nameserver 114.114.114.114' >> /etc/resolv.conf
if [ $? != 0 ]
then
	echo 'echo /etc/resolv.conf failed'
	exit
fi

#安装服务依赖基本扩展包和库文件
yum install -y gcc gcc-c++ openssh-clients vim wget telnet  postfix python-pip libtool
if [ $? != 0 ]
then
	echo 'install system basic libs failed'
	exit
fi


echo '安装系统依赖包结束。。。。。。。。。。。。。。。。。。。。。。。。。。'
