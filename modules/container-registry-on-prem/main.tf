resource "docker_volume" "primary_registry_data" {
  name = "${var.alias}_primary_registry_data"
}

# Run the Docker registry container
resource "docker_container" "registry" {
  name  = "${var.alias}_registry"
  image = docker_image.registry.name
  restart = "${var.restart_policy}"

  ports {
    internal = var.internal_port
    external = var.external_port
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
