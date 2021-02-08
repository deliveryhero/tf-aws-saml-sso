output "saml_provider_arn" {
  value       = aws_iam_saml_provider.main.arn
  description = "ARN of the SAML provider"
}

output "administrator_role_arn" {
  value       = aws_iam_role.administrator.arn
  description = "Adminstrator role ARN"
}

output "readonly_role_arn" {
  value       = aws_iam_role.readonly.arn
  description = "Read only role ARN"
}

output "ec2fullaccess_role_arn" {
  value       = aws_iam_role.ec2fullaccess.arn
  description = "EC2 full access role ARN"
}

output "sysadmin_role_arn" {
  value       = aws_iam_role.sysadmin.arn
  description = "Sysadmin role ARN"
}

output "developer_role_arn" {
  value       = aws_iam_role.developer.arn
  description = "Developer role ARN"
}

output "poweruser_role_arn" {
  value       = aws_iam_role.poweruser.arn
  description = "Poweruser role ARN"
}
