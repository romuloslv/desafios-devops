#!/bin/sh

echo -e "\n[ Deletando arquivos de configuração... ]\n"
helm delete devops --purge
