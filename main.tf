module "appservice" {
  source                     = "./azure/appservice"
  author                     = var.author
  be_port                    = var.be_port
  be_image_name              = var.be_image_name
  db_name                    = module.db.db_name
  db_password                = module.db.db_password
  db_server                  = module.db.db_server
  db_user                    = module.db.db_user
  fe_image_name              = var.fe_image_name
  fe_port                    = var.fe_port
  mssql_server_name          = module.db.mssql_server_name
  private_endpoint_subnet_id = module.vnet.private_endpoint_subnet_id
  resource_prefix            = "ali"
  rg_location                = module.rg.location
  rg_name                    = module.rg.name
  subnet_be_id               = module.vnet.subnet_be_id
  subnet_fe_id               = module.vnet.subnet_fe_id
  vnet_id                    = module.vnet.vnet_id
  vnet_name                  = module.vnet.vnet_name
  fe_tag                     = var.fe_tag
  be_tag                     = var.be_tag
}

module "db" {
  source                     = "./azure/db"
  author                     = var.author
  db_admin                   = var.db_admin
  db_password                = var.db_password
  rg_id                      = module.rg.id
  vnet_id                    = module.vnet.vnet_id
  subnet_db_id               = module.vnet.subnet_db_id
  subnet_be_id               = module.vnet.subnet_be_id
  rg_name                    = module.rg.name
  rg_location                = module.rg.location
  private_endpoint_subnet_id = module.vnet.private_endpoint_subnet_id
}

module "rg" {
  source      = "./azure/rg"
  rg_location = var.resource_group_location
  rg_name     = var.resource_group_name
}

module "vnet" {
  source      = "./azure/vnet"
  rg_id       = module.rg.id
  rg_location = module.rg.location
  rg_name     = module.rg.name
}

module "nsg" {
  source      = "./azure/nsg"
  rg_location = module.rg.location
  rg_name     = module.rg.name
}
