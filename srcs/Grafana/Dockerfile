# Установка OS
FROM alpine:3.12
LABEL student=gmorra

# Установка приколов 
RUN apk update && apk upgrade 
RUN apk add openrc wget supervisor
RUN	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Установливаем графану
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.6.linux-amd64.tar.gz \
	&& tar -xf grafana-enterprise-7.3.6.linux-amd64.tar.gz --strip-components=1 -C / \
	&& rm grafana-enterprise-7.3.6.linux-amd64.tar.gz 

# Устанавливаем глибс
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

# Копирование конфигов
COPY ./supervisord.conf /etc/supervisord.conf
# COPY ./grafana.db /grafana-7.4.0/data/grafana.db
COPY ./telegraf.conf /etc/telegraf/
RUN ln -s grafana-7.4.0/bin/grafana-server ./grafana-server

# Копирование скрипта и выдача прав 
COPY ./script.sh .
RUN chmod +x script.sh

# Открытие портов + запуск скрипта
EXPOSE 3000
CMD sh script.sh