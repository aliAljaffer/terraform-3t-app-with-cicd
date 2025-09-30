resource "azurerm_network_security_group" "main_nsg" {
  for_each            = local.nsg
  name                = each.key
  location            = var.rg_location
  resource_group_name = var.rg_name

  dynamic "security_rule" {
    for_each = each.value
    content {
      name                       = security_rule.key
      priority                   = 100 + index(keys(each.value), security_rule.key)
      access                     = "Allow"
      protocol                   = "Tcp"
      destination_address_prefix = "*"
      source_address_prefix      = "*"
      direction                  = "Inbound"
      destination_port_range     = security_rule.value
      source_port_range          = "*"
    }
  }
}
