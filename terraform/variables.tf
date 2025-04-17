variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "minha-chave-aws-rge"
  description = "Nome da chave SSH para acessar a instância"
}

variable "aws_vpc_id" {
  default = "vpc-05366b7aca030cabb"
  description = "ID da VPC onde a instância será criada"
}

variable "aws_igw_id" {
  default = "igw-0f94c3b5c9fe99886"
  description = "ID do Internet Gateway para a VPC"
}

variable "db_user" {}
variable "db_pass" {}
variable "db_name" {}
variable "ip" {}
variable "api_key_firebase" {}