# exec_aws_in_external_data_source Module

This Terraform module uses the `external` data source to execute an external script (`get_caller_identity.sh`), which retrieves the AWS caller identity. The module outputs the ARN of the current AWS IAM user or role.

## Required AWS Permissions

To execute this module successfully, the AWS credentials used must have the following IAM permission:

```json
{
  "Effect": "Allow",
  "Action": "sts:GetCallerIdentity",
  "Resource": "*"
}
```
