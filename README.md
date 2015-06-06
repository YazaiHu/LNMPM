# LNMPM
On CentOS6.x To Install LNMPM Environment,Include Mysql、PHP、Nginx、Memcache
#本脚本为部署web服务使用 执行顺序按照脚本末尾001，002。。这样顺序执行 
bash install-src-001.sh 
bash install-lib-002.sh 
bash install-mysql-003.sh 
bash install-php-004.sh 
bash install-nginx-005.sh 
bash install-memcached-006.sh 

or 

excute the install.sh 

bash install.sh 

or 

chomd +x install.sh 
./install.sh 

If you want to use nginx for the website service,please modify the file nginx/conf.d/www.conf what you env want to do.
