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

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=adminpass",
    "POSTGRES_DB=admindb"
  ]

  ports {
    internal = 5432
    external = 5432
  }

  volumes {
    volume_name    = docker_volume.postgres_data_primary.name
    container_path = "/var/lib/postgresql/data"
  }
}