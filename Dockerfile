FROM centos:centos6
MAINTAINER Tad-u
# Install bitnami-redmine 3.1.0-0
ADD bitnami-redmine-linux-x64.run /root/bitnami-redmine-linux-x64.run
RUN chmod +x /root/bitnami-redmine-linux-x64.run

ADD install_bitnami.sh /root/install_bitnami.sh
run chmod +x /root/install_bitnami.sh

ADD patch.txt /root/patch.txt
ADD httpd-patch.txt /root/httpd-patch.txt
ADD rails-patch.txt /root/rails-patch.txt

# prepare for mount
RUN useradd redmine -u 1000 -s /bin/bash --no-create-home

#
ADD redmine.txt  /etc/logrotate.d/redmine
ADD redmine_install.sh /root/redmine_install.sh

VOLUME ["/var/redmine3"]

RUN chmod +x /root/redmine_install.sh
RUN sh /root/redmine_install.sh
