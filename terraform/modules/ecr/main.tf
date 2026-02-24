resource "aws_ecr_repository" "strapi" {
  name = "jaspal-task10-strapi"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true
}
