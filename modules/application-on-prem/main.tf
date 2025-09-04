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


# Container to manage clickhouse deployment
resource "docker_container" "clickhouse" {
  image = docker_image.clickhouse.image_id
  name  = "rest-api-container"

  # HTTP Access
  ports {
    internal = 8080
    external = 8080
  }

  # Database Access
  ports {
    internal = 443
    external = 443
  }

  # Database Access
  ports {
    internal = 80
    external = 80
  }

  restart  = "always"

}