# Установка OS
FROM alpine:3.12
LABEL student=gmorra

# Установка приколов
RUN apk update && apk upgrade
RUN apk add supervisor influxdb 
	# apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# Копирование конфигов
COPY ./supervisord.conf /etc/supervisord.conf
# COPY ./telegraf.conf /etc/telegraf/

# Копиррование скрипта и выдача прав
COPY ./script.sh /
RUN chmod +x /script.sh

# Открытие вольюма и портов, запуск скрипта
VOLUME	["var/lib/influxdb"]
EXPOSE 8086

CMD sh ./script.sh