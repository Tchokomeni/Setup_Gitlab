variable "instance_type" {
  description = "Type d'instance EC2 (t2.micro, t2.medium, etc.)"
  type        = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Nom de la clé SSH pour accéder à l'instance"
  type        = string
  default = "tchoko_key_gitlab"
}


variable "instance_name" {
  description = "Nom de l'instance (tag)"
  type        = string
  default     = "gitlab-server"
}


variable "security_groups" {
  description = "Liste des groupes de sécurité associés à l'instance"
  type        = list(string)
  default     = []
}