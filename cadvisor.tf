resource "docker_image" "cadvisor" {
  name = "gcr.io/cadvisor/cadvisor:latest"
}

resource "docker_container" "cadvisor" {
  for_each = var.instances

  name  = "cadvisor-${each.key}"
  image = docker_image.cadvisor.image_id

  ports {
    internal = 8080
    external = null
  }

  mounts {
    target    = "/rootfs"
    source    = "/"
    type      = "bind"
    read_only = true
  }
  mounts {
    target = "/var/run"
    source = "/var/run"
    type   = "bind"
  }
  mounts {
    target    = "/sys"
    source    = "/sys"
    type      = "bind"
    read_only = true
  }
  mounts {
    target    = "/var/lib/docker"
    source    = "/var/lib/docker"
    type      = "bind"
    read_only = true
  }
}