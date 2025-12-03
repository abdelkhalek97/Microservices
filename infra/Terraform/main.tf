module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  region       = var.region
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "eks" {
  source       = "./modules/eks"
  project_name = var.project_name
  cluster_name = var.cluster_name
  region       = var.region
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.subnet_ids
  desired_capacity  = var.desired_capacity
  max_capacity      = var.max_capacity
  min_capacity      = var.min_capacity
  node_instance_type = var.node_instance_type
}

module "iam_ebs_csi" {
  source            = "./modules/iam-ebs-csi"
  cluster_name      = var.cluster_name
  region            = var.region
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider_url
}

module "helm_ebs_csi" {
  source               = "./modules/helm-ebs-csi"
  service_account_name = module.iam_ebs_csi.service_account_name
}

module "monitoring" {
  source       = "./modules/monitoring"
  cluster_name = module.eks.cluster_name
}

