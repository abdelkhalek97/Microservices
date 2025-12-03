variable "project_name" {
  type    = string
  default = "pwc-python"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "cluster_name" {
  type    = string
  default = "eks-pwc-python"
}

variable "desired_capacity" {
  type    = number
  default = 3   # how many nodes you want initially
}

variable "max_capacity" {
  type    = number
  default = 4   # upper limit for autoscaling
}

variable "min_capacity" {
  type    = number
  default = 2   # minimum nodes to keep
}

variable "node_instance_type" {
  type    = string
  default = "t3.small"   # or m5.large depending on workload
}