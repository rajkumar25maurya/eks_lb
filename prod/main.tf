module "eks-prod" {
  source                  = "../"
  region                  = "us-east-1"
  eks_version             = "1.30"
  https_port              = 443
  eks_cluster_name        = "infra-platform"
  node_group_name         = "infra-platform-NodeGroup"
  master_eks_role         = "infra-platform_master-eks-role"
  worker_eks_role         = "infra-platform-worker-eks-role"
  instance_type           = "t2.2xlarge"
  desire_size             = 2
  max_size                = 3
  min_size                = 2
  ami_type                = "AL2_x86_64"
  disk_size               = 50
  service_port            = 80
  service_type            = "NodeGroup"
  force_update_version    = false
  capacity_type           = "ON_DEMAND"
  endpoint_private_access = false
  endpoint_public_access  = true
  security_group          = "infra-platform-eks-access"
  autoscaler_policy       = "infra-platform_eks_autoscaler_policy"
  eks_policy              = "infra-platform_eks_policy"
  subnets                 = data.aws_subnets.main.ids
}

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["infra-platform"]
  }
}




data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
  filter {
    name   = "tag:Type"
    values = ["Private"]
  }
}


