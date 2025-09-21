variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "image_tag" {
  description = "Image tag for the Docker container"
  type        = string
}

variable "registry_host" {
  description = "Host of the image registry"
  type        = string
}
