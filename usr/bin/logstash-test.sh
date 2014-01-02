#!/bin/bash

rm -f /etc/logstash/sample/*.db
java -jar /usr/share/logstash/logstash.jar agent -f /etc/logstash/logstash-test.conf
