#!/bin/sh

# Para utilização com modulos comente as linhas descomentadas e descomente as linhas comentadas.

#echo -e "\n[ Atualizando o repositório... ]\n"
#/usr/bin/terraform get -update departamentos/
#echo -e "\n[ Inicialização dos plugins... ]\n"
#/usr/bin/terraform init departamento/
#echo -e "\n[ Revisão de cenário... ]\n"
#/usr/bin/terraform plan departamento/
#echo -e "\n[ Construindo sua infra... ]\n"
#/usr/bin/terraform apply departamento/

echo -e "\n[ Inicialização dos plugins... ]"
/usr/bin/terraform init infra/
echo -e "\n[ Revisão de cenário... ]\n"
/usr/bin/terraform plan infra/
echo -e "\n[ Construindo sua infra... ]\n"
/usr/bin/terraform apply infra/

