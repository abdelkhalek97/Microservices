resource "aws_ecr_repository" "repo" {
  name                 = "microservices"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  encryption_configuration {
    encryption_type = "AES256"
  }
  tags = { Project = var.project_name }
}
