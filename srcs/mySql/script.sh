# install mariadb
mariadb-install-db -u admin

# start mysql
mysqld -u admin & sleep 5

# create database
mysql -u root --execute="CREATE DATABASE wordpress;"

# import
mysql -u root wordpress < wordpress.sql

# create user no password
mysql -u root --execute="CREATE USER 'admin'@'%' IDENTIFIED BY ''; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

/usr/bin/supervisord -c /etc/supervisord.conf