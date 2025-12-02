output "service_account_name" {
  value = kubernetes_service_account.ebs_csi_controller.metadata[0].name
}

output "iam_role_arn" {
  value = aws_iam_role.ebs_csi_driver.arn
}
