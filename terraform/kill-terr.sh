#!/bin/sh

echo -e "\n[ Removendo sua infra... ]\n"
/usr/bin/terraform destroy infra/
