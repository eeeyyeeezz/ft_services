FROM alpine:3.12
LABEL student=gmorra

# Установка приколов
RUN apk update && apk upgrade
RUN apk add mariadb mariadb-common mariadb-client supervisor sudo \
	&& apk add openrc mysql-client
	# && apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Копирование конфигов
RUN mkdir -p /run/mysqld/
COPY ./script.sh /tmp/
COPY ./my.cnf /etc/
COPY ./supervisord.conf /etc/supervisord.conf
# COPY ./wordpress.sql /

# Выдача прав
RUN sudo chmod -R 755 /var/lib/mysql/
RUN	chmod +x tmp/script.sh

# Открытие портов и вольюм чтобы ничего не взрывалось + запуск скрипта
EXPOSE 3306	
VOLUME ["/var/lib/mysql"]

ENTRYPOINT sh /tmp/script.sh