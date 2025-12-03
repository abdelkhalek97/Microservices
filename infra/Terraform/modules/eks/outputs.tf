output "cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "cluster_ca" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}

# OIDC provider ARN for IRSA
output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}

# OIDC provider URL (issuer URL)
output "oidc_provider_url" {
  value = aws_iam_openid_connect_provider.eks.url
}

output "node_role_name" {
  value = aws_iam_role.eks_node_role.name
}