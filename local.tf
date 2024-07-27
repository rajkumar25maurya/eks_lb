locals {
  aws_region       = var.region
  eks_version      = var.eks_version
  https_port       = var.https_port
  eks_cluster_name = var.eks_cluster_name
  node_group_name  = var.node_group_name
  master_eks_role  = var.master_eks_role
  worker_eks_role  = var.worker_eks_role
  instance_type    = var.instance_type
  desire_size      = var.desire_size
  max_size         = var.max_size
  min_size         = var.min_size
  ami_type         = var.ami_type
  disk_size        = var.disk_size
  service_port     = var.service_port
  service_type     = var.service_type
}