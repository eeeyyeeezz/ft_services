FROM alpine:3.12
LABEL student=gmorra

RUN apk update && apk upgrade
RUN	apk add nginx openssl

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY script.sh ./

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=gmorra/CN=localhost"
RUN mkdir -p /run/nginx

RUN chmod +x script.sh
EXPOSE 80 443
CMD sh script.sh