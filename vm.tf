locals {
  image_map = {
    ubuntu = docker_image.ubuntu.image_id
    arch   = docker_image.archlinux.image_id
  }
}

resource "docker_container" "vm" {
  name       = "vm-${var.os}"
  image      = lookup(local.image_map, var.os, null)
  cpu_shares = var.cpu_max
  memory     = var.mem_max

  lifecycle {
    precondition {
      condition     = contains(["ubuntu", "arch"], var.os)
      error_message = "L'OS '${var.os}' n'est pas supporté. Choisissez 'ubuntu' ou 'arch'."
    }
  }
}