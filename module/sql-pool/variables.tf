variable "rg_resource" {
  description = "Resource Groups Name"
  default = ""
  type = string
}

variable "location_resource" {
  description = "Location Resource"
  default = ""
  type = string
}

variable "tags_resource" {
  description = "Tags Resource"
  default = null
  type = map(string)
}

variable "sqlpool_name" {
  description = "Name SQL Data Base Pool"
  default = ""
  type = string
}

variable "sqlpool_servername" {
  description = "Server Name SQL DB"
  default = ""
  type = string
}

variable "sqlpool_sizegb" {
  description = "Max size GB SQL DB Pool"
  default = 4.8828125
  type = number
}

variable "sqlpool_sku" {
  description = "SKU SQL Pool"
  type = object({
    name = string
    tier = string
    capacity = number
  })

  default = {
    name = "BasicPool"
    tier = "Basic"
    capacity = 50
  }
}

variable "sqlpool_perdbsetting" {
  description = "General configuration per database"
  type = object({
    min_capacity = number
    max_capacity = number
  })

  default = {
    min_capacity = 0
    max_capacity = 5
  }
}