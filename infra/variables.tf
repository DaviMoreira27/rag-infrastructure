variable "environment" {
  description = "Environment that the resource will be created upon"
  type        = string
  default     = "development"

  validation {
    condition     = contains(["development", "homolog", "staging", "production"], var.Environment)
    error_message = "Environment must be one of: development, homolog, staging, production."
  }
}
