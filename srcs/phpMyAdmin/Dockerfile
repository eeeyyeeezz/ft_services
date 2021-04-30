FROM alpine:3.12
LABEL student=gmorra

# Установка приколов
RUN apk update && apk upgrade
RUN apk add lighttpd php7-common php7-session		\
php7-iconv php7-json php7-gd php7-curl php7-xml		\
php7-mysqli php7-imap php7-cgi fcgi php7-pdo		\
php7-pdo_mysql php7-soap php7-xmlrpc php7-posix		\
php7-mcrypt php7-gettext php7-ldap php7-ctype		\
php7-dom mysql mysql-client php-mysqli supervisor	
# telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache


# Установка phpMyAdmin
RUN mkdir -p /usr/share/webapps/	&&	cd /usr/share/webapps											
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz		
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz	&&	rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz		
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin	&&	chmod -R 777 /usr/share/webapps/				
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin							


# Установка конфигов
RUN mkdir -p /run/nginx	&& mkdir -p /var/run/php	
COPY ./nginx.conf /etc/nginx/conf.d/default.conf			
COPY ./supervisor.conf /etc/supervisord.conf		
COPY ./config.inc.php /www/phpmyadmin/					


# Копирование скрипта и выдача прав
COPY ./script.sh /
RUN	chmod +x script.sh

# Открытие портов и запуск
EXPOSE 5000
CMD sh ./script.sh