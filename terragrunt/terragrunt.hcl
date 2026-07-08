generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_providers {
    scalr = {
      source  = "Scalr/scalr"
      version = "~> 3.0"
    }
  }
}
EOF
}

generate "main" {
  path      = "main.tf"
  if_exists = "overwrite"
  contents  = <<EOF
data "scalr_workspace_ids" "all" {
  names          = ["*"]
  environment_id = var.environment_id
}
variable "environment_id" { type = string }

output "workspace_ids" {
  value = data.scalr_workspace_ids.app_frontend.ids
}
EOF
}
