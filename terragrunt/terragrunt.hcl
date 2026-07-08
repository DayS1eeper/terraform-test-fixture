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
resource "terraform_data" "sleep" {
  provisioner "local-exec" {
    command = "sleep 1"
  }
}
EOF
}
