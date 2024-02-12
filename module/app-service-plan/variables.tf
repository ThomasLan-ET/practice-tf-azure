
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

variable "asp_name" {
  description = "Name App Service Plan"
  default = ""
  type = string
}

variable "asp_sku" {
  description = "SKU App Service Plan"
  default = "B1"
  type = string
}