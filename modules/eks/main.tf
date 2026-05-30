# EKS Cluster
resource "aws_eks_cluster" "eks" {
  name = "${var.platform}-${var.environment}-eks-cluster"
  version = var.cluster_version
  role_arn = aws_iam_role.eks_cluster_role.arn
  enabled_cluster_log_types = [
  "api",
  "audit",
  "authenticator"
]
  access_config {
     authentication_mode                         = "API_AND_CONFIG_MAP"
     bootstrap_cluster_creator_admin_permissions = true
  }
  vpc_config {
    subnet_ids = var.private_subnets
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster
  ]
}

# EKS Node Group
resource "aws_eks_node_group" "nodegroup" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.platform}-${var.environment}-eks-nodegroup"

  node_role_arn = aws_iam_role.worker_role.arn

  subnet_ids = var.private_subnets

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  instance_types = ["t3.medium"]

  depends_on = [
    aws_iam_role_policy_attachment.worker,
    aws_iam_role_policy_attachment.worker_cni,
    aws_iam_role_policy_attachment.worker_ecr
  ]
}
#IAM role for EKS Cluster
resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.platform}-${var.environment}-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"

      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

#iam policy attachment for EKS Cluster
resource "aws_iam_role_policy_attachment" "cluster" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "worker_role" {
  name = "${var.platform}-${var.environment}-eks-worker-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

#iam policy attachment for EKS Worker
resource "aws_iam_role_policy_attachment" "worker" {
  role       = aws_iam_role.worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


#newly added
resource "aws_iam_role_policy_attachment" "worker_cni" {
  role       = aws_iam_role.worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "worker_ecr" {
  role       = aws_iam_role.worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
