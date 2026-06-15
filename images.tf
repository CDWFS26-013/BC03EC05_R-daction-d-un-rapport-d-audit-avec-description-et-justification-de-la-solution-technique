resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

resource "docker_image" "archlinux" {
  name = "archlinux:latest"
}