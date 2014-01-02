#!/bin/bash
VERSION=1.3.2
cd ..

#git clone git@github.com:Shoptet/logstash-packaging.git --depth=1

if [ ! -f logstash-packaging/usr/share/logstash/logstash.jar ]; then
    wget http://download.elasticsearch.org/logstash/logstash/logstash-${VERSION}-flatjar.jar -O logstash-packaging/usr/share/logstash/logstash.jar
fi

fpm -n logstash \
    -v $VERSION \
    -a all \
    -C logstash-packaging \
    -m "<brablc@shoptet.cz>" \
    --pre-install logstash-packaging/logstash.preinstall \
    --description "Logstash Open Source Log Management" \
    --url 'http://www.logstash.net/' \
    -t deb \
    --config-files etc/logstash/logstash.conf \
    -s dir etc usr var
