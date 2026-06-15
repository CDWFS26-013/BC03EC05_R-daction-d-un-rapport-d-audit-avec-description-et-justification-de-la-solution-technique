variable "os" {
  description = "Système d'exploitation choisi : ubuntu ou arch"
  type        = string
}

locals {
  image_map = {
    ubuntu = docker_image.ubuntu.image_id
    arch   = docker_image.archlinux.image_id
  }
}

resource "docker_container" "vm" {
  name    = "vm-${var.os}"
  image   = lookup(local.image_map, var.os, null)
  command = ["sleep", "infinity"]

  lifecycle {
    precondition {
      condition     = contains(["ubuntu", "arch"], var.os)
      error_message = "L'OS '${var.os}' n'est pas supporté. Choisissez 'ubuntu' ou 'arch'."
    }
  }
}