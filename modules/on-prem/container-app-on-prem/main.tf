resource "docker_image" "app_image" {
  name = "${var.registry_host}/${var.app_name}:${var.image_tag}"
}

resource "docker_container" "app_container" {

  name  = "${var.app_name}_container"
  image = docker_image.app_image.name

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  log_driver = "json-file"

  log_opts = {
    "max-size" = "${var.max_size_log}"
    "max-file" = "${var.max_file_log}"
  }

  env = var.environment_variables

  network_mode = "host"

}