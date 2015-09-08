#/bin/bash

docker run -v /var/redmine3/data:/var/redmine3 \
	-p 20080:80 -p 20022:22  \
	-itd --name rm310env centos6:bitnami-rm310env  /sbin/init

