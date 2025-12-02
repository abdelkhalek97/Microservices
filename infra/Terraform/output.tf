output "region" {
  value = var.region
}

output "ecr_repository_url" {
  value = aws_ecr_repository.repo.repository_url
}

output "cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "vpc_id" {
  value = aws_vpc.main.id
}
