module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = "my-eks-cluster"
  cluster_version = var.kubernetes_version

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  enable_irsa = true

  tags = {
    Cluster     = "demo"
    Environment = "dev"
    Owner       = "team"
    Project     = "eks-demo"
  }

  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {
    node_group = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      tags = {
        Name = "primary-node-group"
      }
    }
  }
}
