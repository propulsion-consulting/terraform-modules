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
  name = "clickhouse/clickhouse-server:latest"
}


# Create volume to persist clickhouse data
resource "docker_volume" "clickhouse_data" {
  name = "clickhouse_data"
}

# Container to manage clickhouse deployment
resource "docker_container" "nginx" {
  image = docker_image.clickhouse.image_id
  name  = "clickhouse-container"

  # Attach volume to container
  volumes {
    volume_name = docker_volume.clickhouse_data.name
    container_path = "/var/lib/clickhouse"
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
  env = [
    "CLICKHOUSE_DB=default",
    "CLICKHOUSE_USER=default",
    "CLICKHOUSE_PASSWORD="
  ]

}
