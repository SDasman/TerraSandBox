output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "load_balancer_dns" {
  value = kubernetes_service.nginx.status[0].load_balancer[0].ingress[0].hostname
}

