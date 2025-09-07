module "application-on-prem" {
  source = "../../../modules/application-on-prem"
  app_name = "rest_api_service_template"
  image_tag = "latest"
  registry_host = "localhost:5000"
}