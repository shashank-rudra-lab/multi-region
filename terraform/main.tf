terraform {
  backend "gcs" {
    bucket  = "ncpl-terraform-state"
    prefix  = "multi-region/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region1
}
