# Установка OS 
FROM alpine:3.12
LABEL student=gmorra

# Обновление и установка приколов
RUN apk update && apk upgrade
RUN	apk add nginx openssl openssh supervisor openrc

# Создание юзера
RUN adduser -D gmorra
RUN echo "root:pass" | chpasswd

# Копирование конфигов
RUN mkdir -p /run/nginx
COPY ./supervisord.conf /etc/supervisord.conf
# COPY ./telegraf.conf /etc/telegraf/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY script.sh ./

# Создание ключа
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 			\
-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt	\
-subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=gmorra/CN=localhost"

# Выдача прав на скрипт + порты + запуск
RUN chmod +x script.sh
EXPOSE 80 443 

CMD sh script.sh