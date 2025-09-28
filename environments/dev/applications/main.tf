module "rest-api-service-template-app" {
  source = "../../../modules/container-app-on-prem"
  registry_host = "localhost:5000"
  app_name = "rest_api_service_template"
  image_tag = "latest"
  internal_port = 8080
  external_port = 8080
  max_size_log = "10m"
  max_file_log = "3"
  environment_variables = [
    "REGISTRY_STORAGE_DELETE_ENABLED=true",
    "DB_HOST=localhost",
    "DB_PORT=5432",
    "DB_NAME=rest_api_service_template_db",
    "DB_USER=rest_api_service_template_role",
    "DB_PASSWORD=rest_api_service_template_pass",
    "JWT_SECRET=rest_api_service_template_app_secret"
  ]
}