resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_image" "mariadb" {
  name = "mariadb:latest"
}

locals {
  instance_rds = {
    username = var.db_username
    password = var.db_password
  }
}

resource "docker_container" "postgres" {
  count = var.create_postgres ? 1 : 0
  name  = "rds-postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${local.instance_rds.username}",
    "POSTGRES_PASSWORD=${local.instance_rds.password}"
  ]

  ports {
    internal = 5432
    external = null
  }
}

resource "docker_container" "mariadb" {
  count = var.create_mariadb ? 1 : 0
  name  = "rds-mariadb"
  image = docker_image.mariadb.image_id

  env = [
    "MARIADB_ROOT_PASSWORD=${local.instance_rds.password}",
    "MARIADB_USER=${local.instance_rds.username}",
    "MARIADB_PASSWORD=${local.instance_rds.password}"
  ]

  ports {
    internal = 3306
    external = null
  }
}