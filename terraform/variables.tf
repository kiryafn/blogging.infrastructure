variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "microblogging"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "ses_verified_emails" {
  description = "List of email addresses to verify in SES (you'll need to verify them in AWS console after terraform apply)"
  type        = list(string)
  default     = []
}