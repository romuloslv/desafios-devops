#!/bin/sh

docker build -t webserver:1.0 . && helm init
helm install --name devops ./app-idwaller/ --namespace qa-idwall
