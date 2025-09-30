variable "rg_name" {
  type        = string
  description = "resource group name"
}
variable "rg_location" {
  type        = string
  description = "resource group location"
}

variable "vnet_name" {
  type        = string
  description = "Name of the VNet"
}

variable "fe_port" {
  type        = number
  description = "Port number of the frontend"
}
variable "be_port" {
  type        = number
  description = "Port number of the backend"
}

variable "db_server" {
  type        = string
  description = "Database server FQDN"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_user" {
  type        = string
  description = "Database username"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Database password"
}

variable "author" {
  type        = string
  description = "Name of the author"
  default     = "terraform"
}
variable "resource_prefix" {
  type        = string
  description = "Prefix for resources"
  default     = "devops-tf"
}
variable "subnet_fe_id" {
  type        = string
  description = "ID of the frontend subnet"
}
variable "subnet_be_id" {
  type        = string
  description = "ID of the backend subnet"
}
variable "vnet_id" {
  type        = string
  description = "ID of the VNet"
}
variable "private_endpoint_subnet_id" {
  type        = string
  description = "ID of PE subnet"
}
variable "mssql_server_name" {
  type        = string
  description = "Name of Azure SQL server"
}
variable "be_image_name" {
  type        = string
  description = "The name of the backend image on dockerhub: username/image"
}
variable "fe_image_name" {
  type        = string
  description = "The name of the frontend image on dockerhub: username/image"
}
variable "be_tag" {
  type        = string
  description = "The tag of the backend image on dockerhub: username/image:TAG"
  default     = "latest"
}
variable "fe_tag" {
  type        = string
  description = "The tag of the frontend image on dockerhub: username/image:TAG"
  default     = "latest"
}
