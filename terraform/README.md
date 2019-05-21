# Desafio 01: Infrastructure-as-code - Terraform

## Motivação

Recursos de infraestrutura em nubvem devem sempre ser criados utilizando gerenciadores de configuração, tais como [Cloudformation](https://aws.amazon.com/cloudformation/), [Terraform](https://www.terraform.io/) ou [Ansible](https://www.ansible.com/), garantindo que todo recurso possa ser versionado e recriado de forma facilitada.

## Objetivo

- Criar uma instância **n1-standard-1** (GCP) ou **t2.micro** (AWS) Linux utilizando **Terraform**.
- A instância deve ter aberta somente às portas **80** e **443** para todos os endereços
- A porta SSH (**22**) deve estar acessível somente para um _range_ IP definido.
- **Inputs:** A execução do projeto deve aceitar dois parâmetros:
  - O IP ou _range_ necessário para a liberação da porta SSH
  - A região da _cloud_ em que será provisionada a instância
- **Outputs:** A execução deve imprimir o IP público da instância


## Extras

- Pré-instalar o docker na instância que suba automáticamente a imagem do [Apache](https://hub.docker.com/_/httpd/), tornando a página padrão da ferramenta visualizável ao acessar o IP público da instância
- Utilização de módulos do Terraform

## Notas
- Pode se utilizar tanto AWS quanto GCP (Google Cloud), não é preciso executar o teste em ambas, somente uma.
- Todos os recursos devem ser criados utilizando os créditos gratuitos da AWS/GCP.
- Não esquecer de destruir os recursos após criação e testes do desafio para não haver cobranças ou esgotamento dos créditos.

## Execução

Clone o repositório para seu host, entre no diretório do desafio terraform
e execute o script run-terr.sh

```bash
root@SKYNET:~# git clone https://github.com/romuloslv/desafios-devops.git
Cloning into 'desafios-devops'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 32 (delta 0), reused 2 (delta 0), pack-reused 29
Unpacking objects: 100% (32/32), done.
root@SKYNET:~# cd /desafios-devops/terraform
root@SKYNET:~/desafios-devops/terraform# ls
departamentos  infra  README.md  run-terr.sh kill-terr.sh
root@SKYNET:~/desafios-devops/terraform# bash run-terr.sh
```
Algumas informações referentes ao console de gerenciamento da AWS serão pedidas:

![](https://i.imgur.com/Ff3d2ht.png)

Após válidar os dados o ip público da instância é retornado:

![](https://i.imgur.com/47AMKfP.png)

Teste e desalocação dos recursos criados:

***root@SKYNET:~/desafios-devops/terraform# curl -I [54.146.238.93](https://i.imgur.com/3v9neOz.png)***

```bash
HTTP/1.1 200 OK
Date: Tue, 21 May 2019 01:21:49 GMT
Server: Apache/2.4.39 (Unix)
Last-Modified: Mon, 11 Jun 2007 18:53:14 GMT
ETag: "2d-432a5e4a73a80"
Accept-Ranges: bytes
Content-Length: 45
Content-Type: text/html
```
Para remover digite o comando abaixo

```bash
root@SKYNET:~/desafios-devops/terraform# bash kill-terr.sh 
```
[ Removendo a infra... ](https://i.imgur.com/z8Pn7Gp.png)
