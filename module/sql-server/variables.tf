
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

variable "sqlserver_name" {
  description = "SQL Server Name"
  default = ""
  type = string
}

variable "sqlserver_version" {
  description = "SQL Server Version"
  default = "12.0"
  type = string
}

variable "sqlserver_admin_user" {
  description = "SQL Server User"
  default = "sxadmin"
  type = string 
}