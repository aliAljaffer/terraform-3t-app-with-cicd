locals {
  nsg = {
    fe_nsg = {
      allow_http  = "80",
      allow_https = "443",
    }
    be_nsg = {
      allow_http  = "80",
      allow_https = "443",
    }
    db_nsg = {
      allow_be = "1433"
    }
  }
}
