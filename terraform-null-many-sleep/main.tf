variable "sleep_time" {
  default = 60
}
variable "run_id" {
  default = "run-abc"
  sensitive = true
}

resource "null_resource" "wait"{
  count = 110
  triggers = {
    run_id = var.run_id
  }
  provisioner "local-exec" {
    command = "sleep ${var.sleep_time}"
  }
}
