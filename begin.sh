minikube stop
minikube delete
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb

docker build -t nginx_image srcs/nginx
kubectl apply -f ./srcs/nginx/config.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t mysql_image ./srcs/mySql
kubectl apply -f ./srcs/mySql/mysql.yaml

docker build -t wordpress_image ./srcs/Wordpress
kubectl apply -f ./srcs/Wordpress/wordpress.yaml

docker build -t phpmyadmin_image ./srcs/phpMyAdmin
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml

# docker build -t ftps_image ./srcs/ftps/ftps.yaml
# kubectl apply -f ./srcs/ftps/ftps.yaml

minikube dashboard