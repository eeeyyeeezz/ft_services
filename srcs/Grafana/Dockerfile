# Установка OS
FROM alpine:3.12
LABEL student=gmorra

# Установка приколов 
RUN apk update && apk upgrade 
RUN apk add openrc wget supervisor libc6-compat
RUN	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Установливаем графану
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN rm -rf grafana-7.4.0.linux-amd64.tar.gz

# Копирование конфигов
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./grafana.db /grafana-7.4.0/data/grafana.db
COPY ./telegraf.conf /etc/telegraf/
RUN ln -s grafana-7.4.0/bin/grafana-server ./grafana-server

# Копирование скрипта и выдача прав 
COPY ./script.sh .
RUN chmod +x script.sh

# Открытие портов + запуск скрипта
EXPOSE 3000
CMD sh script.sh