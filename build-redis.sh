#!/bin/bash
REDIS_VERSION=3.2.3
#echo Downloading deps :
#rpm -ivh  http://dl.fedoraproject.org/pub/epel/6/$(uname -m)/epel-release-6-8.noarch.rpm
yum install gcc wget -y

wget "http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz" -cO SOURCES/redis-${REDIS_VERSION}.tar.gz

[ ! -f SOURCES/php-${REDIS_VERSION}-strip.tar.xz ] && cd SOURCES && ./strip.sh ${REDIS_VERSION} && cd ..

cat SPECS/redis.spec.tpl |sed "s/TPL_REDIS_VERSION/$REDIS_VERSION/g" > SPECS/redis.spec

rpmbuild --define "_topdir `pwd`" -bb SPECS/redis.spec
