#!/bin/sh

minikube status | grep -i "running" -m 1

if [ $? -ne 0 ]
then
        minikube start
fi

echo -e "\n[ Construindo imagem local... ]\n"
docker build -t webserver:1.0 . && helm init --upgrade
echo -e "\n[ Instalando a aplicação... ]\n"
helm install --name devops ./app-idwaller/ --namespace qa-idwall
echo -e "\n[ Acrescentando o IP no DNS local /etc/hosts ]\n"
echo "$(minikube ip) idwaller.devops.sp" | tee -a /etc/hosts
