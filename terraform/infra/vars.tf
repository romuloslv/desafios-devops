variable "aws_access_key" { description = "Informe a chave de acesso IAM." }
variable "aws_secret_key" { description = "Informe a senha de acesso IAM." }
variable "aws_region" { description = "Informe a região que deseja provisionar a instância." }
variable "limit_ip" { description = "Informe seu ip público, EX: 45.234.102.221/24" }
variable "key_name" { description = "Informe a chave.pem para acessar sua instância." }


variable "amis" {
  type    = "map"
  default = {
    us-east-1 = "ami-a4c7edb2"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

