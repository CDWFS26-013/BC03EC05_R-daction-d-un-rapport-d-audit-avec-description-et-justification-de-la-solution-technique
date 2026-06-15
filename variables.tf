variable "os" {
  description = "Système d'exploitation : ubuntu ou arch"
  type        = string
}

variable "cpu_max" {
  description = "Nombre maximum de CPU alloués au conteneur"
  type        = number
}

variable "mem_max" {
  description = "Mémoire maximale allouée au conteneur (en Mo)"
  type        = number
}