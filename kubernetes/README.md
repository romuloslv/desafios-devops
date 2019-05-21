# Desafio 02: Kubernetes

## Motivação

Kubernetes atualmente é a principal ferramenta de orquestração e _deployment_ de _containers_ utilizado no mundo, práticamente tornando-se um padrão para abstração de recursos de infraestrutura. 

Na IDWall todos nossos serviços são containerizados e distribuídos em _clusters_ para cada ambiente, sendo assim é importante que as aplicações sejam adaptáveis para cada ambiente e haja controle via código dos recursos kubernetes através de seus manifestos. 

## Objetivo
Dentro deste repositório existe um subdiretório **app** e um **Dockerfile** que constrói essa imagem, seu objetivo é:

- Construir a imagem docker da aplicação
- Criar os manifestos de recursos kubernetes para rodar a aplicação (_deployments, services, ingresses, configmap_ e qualquer outro que você considere necessário)
- Criar um _script_ para a execução do _deploy_ em uma única execução.
- A aplicação deve ter seu _deploy_ realizado com uma única linha de comando em um cluster kubernetes **local**
- Todos os _pods_ devem estar rodando
- A aplicação deve responder à uma URL específica configurada no _ingress_


## Extras 
- Utilizar Helm [HELM](https://helm.sh)
- Divisão de recursos por _namespaces_
- Utilização de _health check_ na aplicação
- Fazer com que a aplicação exiba seu nome ao invés de **"Olá, candidato!"**

## Notas

* Pode se utilizar o [Minikube](https://github.com/kubernetes/minikube) ou [Docker for Mac/Windows](https://docs.docker.com/docker-for-mac/) para execução do desafio e realização de testes.

* A aplicação sobe por _default_ utilizando a porta **3000** e utiliza uma variável de ambiente **$NAME**

* Não é necessário realizar o _upload_ da imagem Docker para um registro público, você pode construir a imagem localmente e utilizá-la diretamente.

# Laboratório para execução das atividades

## Pré Requisitos

* [Docker](https://docs.docker.com/install/)
* [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [Helm](https://helm.sh/docs/using_helm/)

## Execução

Clone o repositório para seu host, entre no diretório do desafio kubernetes
e execute o script para provisionar o seu cenário: run-helm.sh ou run-kbctl.sh

> OBS: Nesta solução, utilizaremos o daemon do docker como registrador de imagens locais.

## Deploy com o kubernetes

```bash
root@SKYNET:~/desafios-devops/kubernetes# ls
app  app-idwaller  Dockerfile  kill-helm.sh  kill-kbctl.sh  manifestos  README.md  run-helm.sh  run-kbctl.sh
root@SKYNET:~/desafios-devops/kubernetes# bash run-kbctl.sh
😄  minikube v1.0.1 on linux (amd64)
🤹  Downloading Kubernetes v1.14.1 images in the background ...
💡  Tip: Use 'minikube start -p <name>' to create a new cluster, or 'minikube delete' to delete this one.
🔄  Restarting existing virtualbox VM for "minikube" ...
⌛  Waiting for SSH access ...
📶  "minikube" IP address is 192.168.99.111
🐳  Configuring Docker as the container runtime ...
🐳  Version of container runtime is 18.06.3-ce
⌛  Waiting for image downloads to complete ...
✨  Preparing Kubernetes environment ...
🚜  Pulling images required by Kubernetes v1.14.1 ...
🔄  Relaunching Kubernetes v1.14.1 using kubeadm ... 
⌛  Waiting for pods: apiserver proxy etcd scheduler controller dns
📯  Updating kube-proxy configuration ...
🤔  Verifying component health ......
💗  kubectl is now configured to use "minikube"
🏄  Done! Thank you for using minikube!

host: Running

[ Construindo imagem local... ]

Sending build context to Docker daemon  35.84kB
Step 1/6 : FROM node:9-alpine
 ---> a56170f59699
Step 2/6 : WORKDIR /src
 ---> Using cache
 ---> e2ecbb6cc58a
Step 3/6 : COPY app/ .
 ---> Using cache
 ---> 452e4ba3af78
Step 4/6 : RUN npm install --quiet
 ---> Using cache
 ---> 42fd868b3848
ltep 5/6 : EXPOSE 3000
 ---> Using cache
 ---> 725189112fd0
Step 6/6 : CMD ["npm", "start"]
 ---> Using cache
 ---> b5604ab57b66
Successfully built b5604ab57b66
Successfully tagged webserver:1.0

[ Habilitando ingress... ]

✅  ingress was successfully enabled

[ Configurando seu cluster... ]

namespace/qa-idwall created
deployment.apps/deployment-aplicacao-idwall created
service/servico-aplicacao-idwall created
ingress.extensions/ingress-idwall created

[ Acrescentando o IP no DNS local /etc/hosts ]

192.168.99.111 idwaller.devops.sp

[ Acesse: http://idwaller.devops.sp/ ]

[ Painel: minikube dashboard --url & ]

```

###Testando k8s

```bash
root@SKYNET:~/desafios-devops/kubernetes# curl http://idwaller.devops.sp/ && echo -e "\n" && curl -I http://idwaller.devops.sp/
Olá Rômulo Ferreira da Silva!

HTTP/1.1 200 OK
Server: nginx/1.15.9
Date: Tue, 21 May 2019 04:04:14 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 31
Connection: keep-alive
X-Powered-By: Express
ETag: W/"1f-2WVazwZO7bS8GbrbTuBCC0hCr1g"
```
