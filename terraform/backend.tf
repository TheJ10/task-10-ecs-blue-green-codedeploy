terraform {
  backend "s3" {
    bucket = "jaspal-task10-terraform-state"
    key    = "task-10-blue-green/terraform.tfstate"
    region = "us-east-1"
  }
}
