minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable nvidia-gpu-device-plugin


docker build -t nginx_image srcs/nginx
kubectl apply -f ./srcs/nginx/config.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t mysql_image ./srcs/mySql
kubectl apply -f ./srcs/mySql/mysql.yaml

docker build -t wordpress_image ./srcs/Wordpress
kubectl apply -f ./srcs/Wordpress/wordpress.yaml

docker build -t phpmyadmin_image ./srcs/phpMyAdmin
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml

docker build -t ftps_image ./srcs/FTPS
kubectl apply -f ./srcs/ftps/ftps.yaml

# docker build -t influxdb_image ./srcs/InfluxDB.
# kubectl apply -f ./srcs/InfluxDB/influxdb.yaml

minikube dashboard
