/*
That link is a tutorial, not necessarily a prescription for the best way to do something in all scenarios. In this scenario, if you are storing sensitive values in a .tfvars file (which I would not generally recommend), then yes, you absolutely want to add a line in .gitignore for *.tfvars. Storing sensitive information in .tfvars is not a good practice but committing sensitive information to Git should be one of the deadly sins.

When dealing with sensitive information I usually create passwords via Secrets Manager (AWS) and then use reference attributes to retrieve them or I'll store them in parameter store and import them using using the SSM Parameter data source.

data "aws_ssm_parameter" "my_sensitive_val" {
  name = "/some/path"
}

Then you can reference it:

data.aws_ssm_parameter.my_sensitive_val.value
*/

variable "environment" {
  description = "Environment that the resource will be created upon"
  type        = string
  default     = "development"

  validation {
    condition     = contains(["development", "homolog", "staging", "production"], var.environment)
    error_message = "Environment must be one of: development, homolog, staging, production."
  }
}
