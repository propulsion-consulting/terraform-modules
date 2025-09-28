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

# Deploy on prem clickhouse cluster
module "clickhouse-on-prem" {
  source          = "../../../modules/clickhouse-on-prem"
  image_name      = "clickhouse/clickhouse-server:latest"
  container_name  = "clickhouse-deployment"
  clickhouse_volume_name  = "clickhouse"
  environment_variables = [
    "CLICKHOUSE_DB=default",
    "CLICKHOUSE_USER=default",
    "CLICKHOUSE_PASSWORD=testingpassword"
  ]
}

# Postgres application cluster deployment
module "postgres-on-prem" {
  source = "../../../modules/postgres-on-prem"
  alias  = "dsm001-dev"
}

# Locally hosted docker registry
module "dsm001-dev-container-registry" {
  source          = "../../../modules/container-registry-on-prem"
  alias           = "dsm001-dev"
  restart_policy =  "unless-stopped"
  internal_port = 5000
  external_port = 5000
}
