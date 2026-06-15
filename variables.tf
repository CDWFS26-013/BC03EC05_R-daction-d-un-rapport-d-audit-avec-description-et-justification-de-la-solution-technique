variable "instances" {
  description = "Map des instances à créer"
  type = map(object({
    os      = string
    cpu_max = number
    mem_max = number
  }))
}

variable "ssh_username" {
  description = "Nom d'utilisateur SSH par défaut"
  type        = string
}

variable "ssh_password" {
  description = "Mot de passe SSH par défaut"
  type        = string
  sensitive   = true
}