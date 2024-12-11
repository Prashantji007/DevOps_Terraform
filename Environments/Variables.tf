variable "module_rg" {
  type = map(object({
    name = string
    location = string
  }))
}


variable "vnmod" {
  type = map(any)
}

variable "snmod" {
  type = map(any)
}

variable "vmmod" {
  type = map(any)
}

variable "nsgmod" {
  type = map(any)
}
