#!/bin/sh
apt update
apt install -y zip unzip mariadb-server apache2 libapache2-mod-php7.2 php7.2 php7.2-xml php7.2-gd php7.2-json php7.2-zip php7.2-intl php7.2-curl php7.2-intl php7.2-opcache php7.2-mysql
a2enmod rewrite
service apache2 restart
a2enmod ssl
service apache2 restart
wget https://download.moodle.org/stable38/moodle-latest-38.tgz
tar xf moodle-latest-38.tgz -C /var/www/html/
chown www-data:www-data /var/www/html/moodle/
mkdir /var/www/moodledata
chown www-data:www-data /var/www/moodledata/
service apache2 restart
mysql -u root -p
create database moodle_db collate utf8mb4_general_ci character set utf8mb4;
create user moodle_user@localhost identified by 'qwerty';
grant all privileges on moodle_db.* to moodle_user@localhost;
flush privileges;
exit;

