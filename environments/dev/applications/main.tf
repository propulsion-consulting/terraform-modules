module "application-on-prem" {
  source = "../../../modules/application-on-prem"
  app_db_name = "demoapp"
  app_db_user = "demoapp_user"
  app_db_password = "demoapp_pass"
}