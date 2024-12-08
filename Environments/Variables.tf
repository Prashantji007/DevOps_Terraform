variable "module_rg" {
  type = map(object({
    name = string
    location = string
  }))
}