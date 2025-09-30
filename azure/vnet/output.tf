output "subnet_fe_id" {
  value = azurerm_subnet.fe_subnet.id
}
output "subnet_be_id" {
  value = azurerm_subnet.be_subnet.id
}
output "subnet_db_id" {
  value = azurerm_subnet.db_subnet.id
}
output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}
output "subnet_fe_cidr" {
  value = azurerm_subnet.fe_subnet.address_prefixes
}
output "subnet_be_cidr" {
  value = azurerm_subnet.be_subnet.address_prefixes
}
output "subnet_pe_cidr" {
  value = azurerm_subnet.private_endpoints.address_prefixes
}
output "subnet_db_cidr" {
  value = azurerm_subnet.db_subnet.address_prefixes
}
output "vnet_id" {
  value = azurerm_virtual_network.main_vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.main_vnet.name
}
