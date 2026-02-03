# --- EKS Cluster ---
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_1.id, aws_subnet.public_2.id,
      aws_subnet.private_1.id, aws_subnet.private_2.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_policy]
}

# --- Node Group (HA Setup) ---
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "devops-nodes"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  instance_types = ["t3.small"]

  depends_on = [aws_iam_role_policy_attachment.node_policy_worker,
    aws_iam_role_policy_attachment.node_policy_cni,
  aws_iam_role_policy_attachment.node_policy_registry]
}

# --- ECR Repository ---
resource "aws_ecr_repository" "my_app" {
  name         = "my-js-app"
  force_delete = true
}

# ... Include your IAM Roles for Cluster and Nodes here ...