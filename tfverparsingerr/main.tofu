terraform {
  required_providers {
    scalr = {
      source                = "scalr/scalr"
      version               = "~> 2.0"
      configuration_aliases = [scalr.secondary]
    }
  }
  required_version = ">= 1.11"
}
provider "scalr" {
  # primary account
  hostname = "example.scalr.io"
  token    = var.scalr_token_primary
}
provider "scalr" {
  alias    = "secondary"
  hostname = "other.scalr.io"
  token    = var.scalr_token_secondary
}
data "scalr_current_run" "example" {}
data "scalr_current_run" "example_sec" {
  provider = scalr.secondary
}
resource "scalr_workspace" "example-a" {
  environment_id = data.scalr_current_run.environment_id
  name           = "example-a"
}
resource "scalr_workspace" "example-a" {
  environment_id = data.scalr_current_run.environment_id
  name           = "example-a"
  provider = scalr.secondary
}
