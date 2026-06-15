instances = {
  vm1 = {
    os      = "ubuntu"
    cpu_max = 1024
    mem_max = 512
  }
  vm2 = {
    os      = "arch"
    cpu_max = 2048
    mem_max = 1024
  }
}

ssh_username = "devuser"
ssh_password = "ChangeMe123!"

db_username     = "admin"
db_password     = "DbPass123!"
create_postgres = true
create_mariadb  = true