variable "ARM_SUBSCRIPTION_ID" {
  type        = string
  description = "Azure RM sub ID"
}
variable "db_password" {
  type        = string
  sensitive   = true
  description = "Password for the MSSQL Database"
}
variable "author" {
  type        = string
  description = "Author of the resources"
}
variable "resource_prefix" {
  type        = string
  description = "Resource prefix to add to the names"
}
variable "resource_group_location" {
  type        = string
  description = "Resource group location"
}
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "be_port" {
  type        = number
  description = "Port number for backend"
  default     = 80
}
variable "fe_port" {
  type        = number
  description = "Port number for frontend"
  default     = 80
}

variable "db_admin" {
  type = string
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
