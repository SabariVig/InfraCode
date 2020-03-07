output "kubeconfig" {
  value = local.kubeconfig
}

output "workertoclusterConfgmap" {
  value = local.config_map_aws_auth
}
