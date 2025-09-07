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

# Create a volume for persistent registry storage (primary storage)
resource "docker_volume" "primary_registry_data" {
  name = "${var.alias}_primary_registry_data"
}

# Create a volume for persistent registry storage (secondary storage)
resource "docker_volume" "secondary_registry_data" {
  name = "${var.alias}_secondary_registry_data"
}

# Run the Docker registry container
resource "docker_container" "registry" {
  name  = "${var.alias}_registry"
  image = docker_image.registry.name
  restart = "unless-stopped"

  ports {
    internal = 5000
    external = 5000
  }

  env = [
    "REGISTRY_STORAGE_DELETE_ENABLED=true"
  ]

  volumes {
    volume_name    = docker_volume.primary_registry_data.name
    container_path = "/var/lib/registry"
  }
}

# Pull the Docker registry image
resource "docker_image" "registry" {
  name = "registry:2"
}
