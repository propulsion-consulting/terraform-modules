terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "clickhouse-on-prem" {
  source          = "./modules/clickhouse-on-prem"
  image_name      = "clickhouse/clickhouse-server:latest"
  container_name  = "clickhouse-deployment"
  clickhouse_volume_name  = "clickhouse"
  environment_variables = [
    "CLICKHOUSE_DB=default",
    "CLICKHOUSE_USER=default",
    "CLICKHOUSE_PASSWORD=testingpassword"
  ]
}