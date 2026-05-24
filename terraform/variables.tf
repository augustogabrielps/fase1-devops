variable "aws_region" {
  description = "Regiao AWS onde os recursos serao provisionados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto (usado como prefixo nos recursos)"
  type        = string
  default     = "devops-demo"
}

variable "environment" {
  description = "Ambiente de deploy (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ID da AMI Amazon Linux 2023"
  type        = string
  default     = "ami-0c101f26f147fa7fd" # Amazon Linux 2023 us-east-1
}

variable "key_name" {
  description = "Nome do Key Pair para acesso SSH"
  type        = string
  default     = "devops-key"
}

variable "allowed_ssh_cidr" {
  description = "CIDR permitido para acesso SSH"
  type        = string
  default     = "0.0.0.0/0"
}
