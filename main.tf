resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region us-east-2 --name  ${var.eks_cluster_name}"
  } 
  depends_on = [ aws_eks_node_group.nodes_general, aws_eks_cluster.eks]

  
}

resource "null_resource" "cert_create" {
  provisioner "local-exec" {
    command = "kubectl apply -f certmanager.yaml"
    
  } 
  depends_on = [ aws_eks_node_group.nodes_general, aws_eks_cluster.eks, null_resource.kubectl ]

  
}

resource "null_resource" "aws_lb_create" {
  provisioner "local-exec" {
    command = "kubectl apply -f lb_ctrl.yaml"
    
  } 
  depends_on = [ aws_eks_node_group.nodes_general, aws_eks_cluster.eks, null_resource.kubectl, null_resource.cert_create ]

}

resource "null_resource" "metrics-server" {
  provisioner "local-exec" {
    command = "kubectl apply -f components.yaml"
    
  } 
  depends_on = [ aws_eks_node_group.nodes_general, aws_eks_cluster.eks, null_resource.kubectl, null_resource.cert_create, null_resource.aws_lb_create ]

}

# resource "null_resource" "pod-logs-insight" {
#   provisioner "local-exec" {
#     command = "kubectl apply -f pod-logs-insight.yaml"
    
#   } 
#   depends_on = [ aws_eks_node_group.nodes_general, aws_eks_cluster.eks, null_resource.kubectl, null_resource.cert_create, null_resource.aws_lb_create ]

# }

resource "time_sleep" "wait" {
  depends_on = [ aws_eks_node_group.nodes_general, aws_eks_cluster.eks, null_resource.kubectl, null_resource.cert_create, null_resource.aws_lb_create, null_resource.metrics-server ]  
    create_duration = "90s"
}
