data "external" "caller_identity" {
  program = ["bash", "${path.module}/get_caller_identity.sh"]
}

output "caller_arn" {
  value = data.external.caller_identity.result.Arn
}
