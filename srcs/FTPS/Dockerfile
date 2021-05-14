# Установка OS
FROM alpine:3.12
LABEL student=gmorra

# Установка приколов 
RUN apk update && apk upgrade
RUN apk add vsftpd openssl supervisor sudo
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Создание юзера + ключи
RUN echo "root:pass" | chpasswd
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj \
 "/C=RU/ST=Kazan/L=Kazan/O=21/OU=gmorra/CN=localhost" \
 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

# Копирование конфигов
RUN mkdir -p home/user/
RUN sudo chmod -R 755 home/user/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf/
COPY ./vsftpd.conf /etc/vsftpd/
COPY ./script.sh .

# Выдача прав, открытие портов + запуск скрипта
RUN chmod +x script.sh
EXPOSE 30021 21

CMD sh script.sh
