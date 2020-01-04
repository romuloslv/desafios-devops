#!/bin/sh

kubectl get namespace | grep -i "qa-idwall"

if [ $? -ne 1 ]
then
	echo -e "\n[ Removendo configuração... ]\n"
	kubectl delete namespace qa-idwall
fi

if [ -e tls* ]
then
	rm tls*
fi
