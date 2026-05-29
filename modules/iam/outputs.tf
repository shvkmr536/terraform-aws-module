output "cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "worker_role_arn" {
  value = aws_iam_role.worker_role.arn
}

output "cluster_policy_attachment" {
  value = aws_iam_role_policy_attachment.cluster.id
}

output "worker_policy_attachment" {
  value = aws_iam_role_policy_attachment.worker.id
}