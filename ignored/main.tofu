resource "null_resource" "wait2" {
  provisioner "local-exec" {
    command = "sleep 1"
  }
}
