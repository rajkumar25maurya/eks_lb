# output "oidc_of_eks_cluster" {
#     value = aws_eks_cluster.eks.identity.0.oidc.0.issuer

# }

output "vpc-id" {
  value = data.aws_vpc.main.id

}

output "subnets" {
  value = data.aws_subnets.main.ids

}