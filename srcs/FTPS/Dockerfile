FROM alpine:3.12
LABEL student=gmorra

# Установка приколов
RUN apk update && apk upgrade
RUN apk add vsftpd openssl supervisor sudo
# telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Создание пользователя и создание пароля, а еще ssl вдобавок 
RUN adduser -D gmorra 
RUN echo "gmorra:pass" | chpasswd
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 			\
-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt	\
-subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=gmorra/CN=localhost"

# Копирование конфигов
RUN mkdir -p home/user/
RUN sudo chmod -R 755 home/user/
COPY ./supervisord.conf /etc/supervisord.conf
# COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./vsftpd.conf /etc/vsftpd/

# Копирование скрипта и выдача прав
COPY ./script.sh /
RUN	chmod +x script.sh

# Открытие портов и запуск
EXPOSE 21 30021
CMD sh ./script.sh