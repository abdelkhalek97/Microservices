variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "node_role_name" {
  type        = string
  description = "IAM role name for EKS worker nodes"
}
