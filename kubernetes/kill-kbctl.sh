#!/bin/sh

kubectl get namespace | grep -i "qa-idwall"

if [ $? -ne 1 ]
then
	kubectl delete -f manifestos/. --namespace=qa-idwall
	docker rmi -f webserver:1.0
fi

if [ -e tls* ]
then
	rm tls*
fi
