#!/bin/sh

# Para utilizar certificado, descomente as linhas com # abaixo, e nos arquivos 3-service.yaml
# e 4-ingress.yaml dentro do diretorio desafios-devops/kubernetes/manifestos

minikube status | grep -i "running" -m 1

if [ $? -ne 0 ]
then
        minikube start
fi

echo -e "\n[ Construindo imagem local... ]\n"
eval $(minikube docker-env)
docker build -t webserver:1.0 .

echo -e "\n[ Habilitando ingress... ]\n"
minikube addons enable ingress

#echo -e "\n[ Created SSL cert... ]\n"
#openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=idwaller.devops.sp" -days 365

echo -e "\n[ Configurando seu cluster... ]\n"
kubectl create -f manifestos/.  --namespace qa-idwall
#kubectl create secret tls tls-certificate --key tls.key --cert tls.crt --namespace qa-idwall
echo -e "\n[ Aguarde 1m... ]\n" && sleep 60

kubectl get pods -n qa-idwall && echo ""
kubectl get deploy -n qa-idwall && echo ""
kubectl get services -n qa-idwall && echo ""
kubectl get ingress -n qa-idwall && echo ""

echo -e "[ Acrescentando o IP no DNS local /etc/hosts ]\n"
echo "$(minikube ip) idwaller.devops.sp" | tee -a /etc/hosts
echo -e "\n[ Acesse: http://idwaller.devops.sp/ ]\n"
echo -e "[ Painel: minikube dashboard --url & ]\n"
