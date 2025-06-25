variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "silent-octagon-460701-a0"
}

variable "region1" {
  description = "Primary region (e.g., us-central1)"
  type        = string
  default     = "us-central1"
}

variable "region2" {
  description = "Secondary region (e.g., us-east1)"
  type        = string
  default     = "us-east1"
}
