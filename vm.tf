locals {
  image_map = {
    ubuntu = docker_image.ubuntu.image_id
    arch   = docker_image.archlinux.image_id
  }
}

resource "docker_container" "vm" {
  for_each = var.instances

  name       = "vm-${each.key}"
  image      = lookup(local.image_map, each.value.os, null)
  cpu_shares = each.value.cpu_max
  memory     = each.value.mem_max
  command    = ["sleep", "infinity"]


  lifecycle {
    precondition {
      condition     = contains(["ubuntu", "arch"], each.value.os)
      error_message = "L'OS '${each.value.os}' (instance ${each.key}) n'est pas supporté."
    }
  }
}