# Create Docker volume for data persistence (primary)
resource "docker_volume" "postgres_data_primary" {
  name = "${var.alias}_postgres_data_primary"
}


# Create Docker volume for data persistence (secondary)
resource "docker_volume" "postgres_data_secondary" {
  name = "${var.alias}_postgres_data_secondary"
}

# Pull the Postgres image
resource "docker_image" "postgres" {
  name = "postgres:15"
}

# Run the container
resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.name
  restart = "unless-stopped"

  env = var.environment_variables

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  volumes {
    volume_name    = docker_volume.postgres_data_primary.name
    container_path = "/var/lib/postgresql/data"
  }
}