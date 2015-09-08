#/bin/sh
echo "[STEP-01] Preparing docker build.."
date
REDMINE_VERSION=3.1.0-0
# https://bitnami.com/redirect/to/66920/bitnami-redmine-3.1.0-0-linux-x64-installer.run
#BITNAMI_URL=https://bitnami.com/redirect/to/66920/bitnami-redmine-${REDMINE_VERSION}-linux-x64-installer.run
echo Using stack: ${BITNAMI_URL}
#wget ${BITNAMI_URL}
#mv bitnami-redmine-${REDMINE_VERSION}-linux-x64-installer.run bitnami-redmine-linux-x64.run
#
echo "[STEP-02] Execute to build a docker image"
date
docker build --no-cache=true --rm -t centos6:bitnami-rm310env .
date
#
