resource "aws_ecr_repository" "repo" {
  name                 = "${var.platform}-${var.environment}"
  image_tag_mutability = "IMMUTABLE" #immutable tags are generally safer for production, prevents accidental overwriting of images

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Environment = "${var.environment}"
    ManagedBy   = "Terraform"
  }
}

resource "aws_ecr_lifecycle_policy" "cleanup_policy" {
  repository = aws_ecr_repository.repo.name

  policy = jsonencode({
  rules = [
    {
      rulePriority = 1
      description  = "Delete untagged images after 7 days"

      selection = {
        tagStatus   = "untagged"
        countType   = "sinceImagePushed"
        countUnit   = "days"
        countNumber = 7
      }

      action = {
        type = "expire"
      }
    },

    {
      rulePriority = 2
      description  = "Keep last 30 tagged images"

      selection = {
        tagStatus   = "tagged"
        countType   = "imageCountMoreThan"
        countNumber = 30
      }

      action = {
        type = "expire"
      }
    }
  ]
})
}