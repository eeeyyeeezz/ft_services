FROM alpine:3.12

LABEL student=gmorra

RUN apk update && apk upgrade
RUN apk add sudo mariadb mariadb-common mariadb-client supervisor\
	&& apk add openrc mysql-client
	# && apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./script.sh /tmp/
COPY ./my.cnf /etc/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./wordpress.sql /

RUN sudo chmod -R 755 /var/lib/mysql/
RUN	chmod +x tmp/script.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD tmp/script.sh