#!/bin/sh
install_path=`pwd`

#创建php-fpm用户
echo 'INSTALL PHP SERVICE BEGINNING.............................'
groupadd www
useradd -d /home/www -g www www

#安装php以及相关扩展
yum install -y --enablerepo=remi php-cli php-gd php-fpm php-common php-pear php-mcrypt php-pecl-memcached php-devel php-bcmath php-pdo php-pecl-igbinary php-pecl-uuid php-mbstring php-mysql php-dom

if [ $? != 0 ]
then
	echo 'install php service failed'
	exit
fi


#更改php.ini和php-fpm.conf配置文件
mv /etc/php-fpm.d /etc/php-fpm.d.disabled
if [ $? -ne 0 ]
then	
	echo '备份php-fpm.d 文件夹失败'	
	exit
fi

cp -r $install_path/php-fpm.d /etc
if [ $? -ne 0 ]
then	
	echo '变更php-fpm.d 文件夹失败'	
	exit
fi

mv /etc/php.ini /etc/php.ini.disabled
if [ $? -ne 0 ]
then	
	echo '备份php.ini 文件失败'	
	exit
fi

cp $install_path/php.ini /etc
if [ $? -ne 0 ]
then	
	echo '变更php.ini 文件失败'	
	exit
fi

#start PHP Service
php-fpm -c /etc/php.ini -y /etc/php-fpm.conf

echo  'INSTALL PHP SERVICE OK ..................'
