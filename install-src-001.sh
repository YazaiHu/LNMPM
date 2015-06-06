#!/bin/sh
install_path=`pwd`

echo '更新系统epel、remi源开始。。。。。。。。。。。'
#替换epeo、remi源
mv /etc/yum.repos.d /etc/yum.repos.d.disabled
if [ $? != 0 ]
then
	echo 'mv /etc/yum.repos.d failed'
	exit
fi

mkdir -p /etc/yum.repos.d
if [ $? != 0 ]
then
	echo 'mkdir -p /etc/yum.repos.d failed'
	exit
fi

cp $install_path/yum/*.repo /etc/yum.repos.d
if [ $? != 0 ]
then
	echo  'copy *.repo to /etc/yum.repos.d falied'
	exit
fi

mv /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6 /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6.disabled
if [ $? != 0 ]
then
	echo  'mv /etc/pki/rpm-gpg/RPM* disabled falied'
	exit
fi

mv /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-remi.disabled
if [ $? != 0 ]
then
	echo  'mv /etc/pki/rpm-gpg/RPM*  falied'
	exit
fi

cp ${install_path}/yum/RPM* /etc/pki/rpm-gpg/
if [ $? != 0 ]
then
	echo  'mv /etc/pki/rpm-gpg/RPM*  falied'
	exit
fi

cd /etc/pki/rpm-gpg/; rpm --import *
cd $install_path

echo '更新系统epel、remi源结束。。。。。。。。。。。。。。。。。'

yum make clean
yum makecache

