variable "instances" {
  description = "Map des instances à créer"
  type = map(object({
    os      = string
    cpu_max = number
    mem_max = number
  }))
}