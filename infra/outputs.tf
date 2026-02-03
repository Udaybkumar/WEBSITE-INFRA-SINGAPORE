output "ecr_url" {
  value = aws_ecr_repository.my_app.repository_url
}

output "alb_role_arn" {
  value = aws_iam_role.alb_role.arn
}

output "configure_kubectl" {
  value = "aws eks update-kubeconfig --region ap-southeast-1 --name ${var.cluster_name}"
}