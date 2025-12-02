variable "project_name" {
  type        = string
  default     = "pwc_python"
}

variable "region" {
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  type        = string
  default     = "eks-pwc_python"
}

variable "node_instance_type" {
  type        = string
  default     = "t3.small"
}

variable "desired_capacity" {
  type        = number
  default     = 2
}

variable "max_capacity" {
  type        = number
  default     = 3
}

variable "min_capacity" {
  type        = number
  default     = 1
}
