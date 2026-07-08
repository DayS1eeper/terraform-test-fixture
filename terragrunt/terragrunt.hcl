generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_providers {
    onepassword = {
      source  = "1password/onepassword"
      version = "3.3.1"
    }
  }
}
EOF
}

generate "main" {
  path      = "main.tf"
  if_exists = "overwrite"
  contents  = <<EOF
resource "onepassword_item" "demo" {
  vault    = "vault_id"
  title    = "Demo Terraform Password"
  category = "password"
}
EOF
}
