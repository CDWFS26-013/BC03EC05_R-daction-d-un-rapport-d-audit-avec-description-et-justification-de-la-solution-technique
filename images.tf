resource "docker_image" "ubuntu" {
  name = "ubuntu_custom:latest"
  build {
    context    = "${path.module}/docker/ubuntu"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "archlinux" {
  name = "archlinux:latest"
}