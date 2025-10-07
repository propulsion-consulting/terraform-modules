variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "lifecycle_policy_description" {
  description = "Description for the lifecycle policy"
  type        = string
}

variable "lifecycle_policy_count_type" {
  description = "Count type for the lifecycle policy"
  type        = string
}

variable "lifecycle_policy_count_number" {
  description = "Count number for the lifecycle policy"
  type        = number
}

variable "lifecycle_policy_tag_prefix_list" {
  description = "Tag prefix list for the lifecycle policy"
  type        = list(string)
}
