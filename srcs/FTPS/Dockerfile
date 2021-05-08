FROM alpine:3.12

RUN apk update && apk upgrade && apk add vsftpd openssl supervisor sudo\
	telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN echo "root:pass" | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj \
 "/C=RU/ST=Kazan/L=Kazan/O=21/OU=haristot/CN=localhost" \
 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

RUN mkdir -p home/user/
RUN sudo chmod -R 755 home/user/

COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/vsftpd.conf /etc/vsftpd/
COPY ./srcs/init.sh .

RUN chmod +x init.sh

EXPOSE	21 30021

CMD sh init.sh