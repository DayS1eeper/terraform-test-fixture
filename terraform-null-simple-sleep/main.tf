variable "sleep_time" {
  default = 1
}
variable "run_id" {
  default = "run-abc"
  sensitive = true
}

resource "null_resource" "wait2" {
  triggers = {
    run_id = var.run_id
  }
  provisioner "local-exec" {
    command = "sleep ${var.sleep_time}"
  }
}

resource "terraform_data" "this" {
  input = var.check
}

variable "check" {
  type = number
  default = 1
}
