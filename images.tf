resource "docker_image" "ubuntu" {
  name = "ubuntu_custom:latest"
  build {
    context    = "${path.module}/docker/ubuntu"
    dockerfile = "Dockerfile"
    build_args = {
      SSH_USER     = var.ssh_username
      SSH_PASSWORD = var.ssh_password
    }
  }
}

resource "docker_image" "archlinux" {
  name = "archlinux:latest"
}