#!/bin/sh

# -----------------------
yum update -y -q
yum install -y -q sudo tar passwd expect spawn patch yum-cron logrotate
yum install -y -q openssh-server httpd php php-mbstring mysql-server php-mysql python-setuptools
yum clean all

/root/install_bitnami.sh

echo "End install bitnami script."
# -----------------------
echo "Set enforce status."
setenforce 0
getenforce

patch -p0 /opt/redmine/ctlscript.sh < /root/patch.txt
patch -p0 /opt/redmine/apache2/conf/httpd.conf < /root/httpd-patch.txt
patch -p0 /opt/redmine/apps/redmine/htdocs/config/environments/production.rb < /root/rails-patch.txt

cp /opt/redmine/ctlscript.sh /etc/init.d/bitnami-redmine
mkdir /var/log/bitnami
mkdir /var/log/archive
touch /var/log/bitnami/production.log
chmod a+rw /var/log/bitnami/production.log
chkconfig --add bitnami-redmine

# service bitnami-redmine restart

