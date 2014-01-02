Running package.sh will download logstash and package it into a .deb 
file. Alternatively, you can do it manually:

1) clone this repository

    git clone git@github.com:Shoptet/logstash-packaging.git --depth=1

2) install Jordan Sissel's FPM with gem - you may need to symlink the fpm package

    gem install fpm

3) download the all inclusive logstash jar

    cd logstash-packaging
    wget http://logstash.objects.dreamhost.com/release/logstash-1.1.13-flatjar.jar -O usr/share/logstash/logstash.jar

4) run the following command (with proper logstash version):

    fpm -n logstash -v 1.1.13 -a all -C logstash-packaging -m "<lesspublic@gmail.com>" --pre-install logstash-packaging/logstash.preinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb --config-files etc/logstash/syslog.conf --config-files etc/default/logstash -s dir etc usr var

