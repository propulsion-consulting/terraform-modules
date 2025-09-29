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
  restart  = "always"

  # Attach volume to container
  volumes {
    volume_name = docker_volume.clickhouse_volume.name
    container_path = "/var/lib/clickhouse"
  }

  # Attach admin user config
  volumes {
    host_path = "${var.clickhouse_host_config_path}"
    container_path = "/etc/clickhouse-server/users.d"
  }

  # HTTP Access
  ports {
    internal = var.http_internal_port
    external = var.http_external_port
  }

  # Client Access
  ports {
    internal = var.client_internal_port
    external = var.client_external_port
  }

  # Database Access
  ports {
    internal = var.db_internal_port
    external = var.db_external_port
  }

  # Environment variables
  env = var.environment_variables
}