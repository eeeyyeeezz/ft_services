# Установка OS
FROM alpine:3.12
LABEL student=gmorra

# Установка и обновление приколов
RUN apk update && apk upgrade
RUN apk add mariadb mariadb-common mariadb-client supervisor sudo 
RUN	apk add openrc mysql-client
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Копирование конфигов
RUN mkdir -p /run/mysqld/
COPY ./my.cnf /etc/
COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./wordpress.sql /

# Выдача прав
RUN sudo chmod -R 755 /var/lib/mysql/

# Копирование конфига + выдача прав
COPY ./script.sh .
RUN	chmod +x script.sh
EXPOSE 3306	

# Открытие вольюма + запуск скрипта
VOLUME ["/var/lib/mysql"]
ENTRYPOINT sh ./script.sh