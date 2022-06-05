variable "backend_output_path" {
  default     = "./backend.tf"
  description = "The file path to populate the backend configuration"
}

variable "name_prefix" {
  default     = ""
  description = "s3 bucket name prefix"
}
