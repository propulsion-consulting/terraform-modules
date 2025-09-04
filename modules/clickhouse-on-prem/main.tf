terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

# Pull docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull clickhouse image 
resource "docker_image" "clickhouse" {
  name = var.image_name
}

# Create volume to persist clickhouse data
resource "docker_volume" "clickhouse_volume" {
  name = var.clickhouse_volume_name
}

# Create backup volume to persist clickhouse data
resource "docker_volume" "clickhouse_backup_volume" {
  name = "${var.clickhouse_volume_name}-backup"
}

# Container to manage clickhouse deployment
resource "docker_container" "clickhouse" {
  image = docker_image.clickhouse.image_id
  name  = var.container_name

  # Attach volume to container
  volumes {
    volume_name = docker_volume.clickhouse_volume.name
    container_path = "/var/lib/clickhouse"
  }

  # Attach admin user config
  volumes {
    host_path = "/home/shay/Documents/shay/projects/terraform-modules/config/users.xml"
    container_path = "/etc/clickhouse-server/users.d/custom-users.xml"
  }

  # HTTP Access
  ports {
    internal = 8123
    external = 8123
  }

  # Database Access
  ports {
    internal = 9000
    external = 9000
  }

  # Database Access
  ports {
    internal = 9009
    external = 9009
  }

  # Environment variables
  env = var.environment_variables

  restart  = "always"

}