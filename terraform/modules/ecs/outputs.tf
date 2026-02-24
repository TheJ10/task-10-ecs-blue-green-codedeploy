output "cluster_name" {
  value = aws_ecs_cluster.jaspal_task10_cluster.name
}

output "service_name" {
  value = aws_ecs_service.jaspal_task10_service.name
}