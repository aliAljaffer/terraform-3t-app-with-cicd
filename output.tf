output "domains" {
  value = [module.appservice.be_app_fqdn, module.appservice.fe_app_fqdn]
}
