module "rest-api-serivce-template-db" {
  source = "../../../modules/postgres-appdb-on-prem"
  admin_db_name = "admindb"
  admin_db_host = "localhost"
  admin_db_port = 5432
  admin_db_user = "admin"
  admin_db_pass = "adminpass"
  admin_db_connection_timeout = 15
  app_db_name = "rest_api_service_template_db"
  app_db_user = "rest_api_service_template_role"
  app_db_pass = "rest_api_service_template_pass"
}

module "system-testing-db" {
  source = "../../../modules/postgres-appdb-on-prem"
  admin_db_name = "admindb"
  admin_db_host = "localhost"
  admin_db_port = 5432
  admin_db_user = "admin"
  admin_db_pass = "adminpass"
  admin_db_connection_timeout = 15
  app_db_name = "system_testing_db"
  app_db_user = "system_testing_role"
  app_db_pass = "system_testing_pass"
}