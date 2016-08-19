#!/bin/bash
REDIS_VERSION=3.2.3
yum install gcc wget rpm-build -y

wget "http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz" -cO SOURCES/redis-${REDIS_VERSION}.tar.gz

cat SPECS/redis.spec.tpl | sed "s/TPL_REDIS_VERSION/$REDIS_VERSION/g" > SPECS/redis.spec

rpmbuild --define "_topdir `pwd`" -bb SPECS/redis.spec
