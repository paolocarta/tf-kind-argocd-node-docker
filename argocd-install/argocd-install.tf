resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

locals {
  install_manifests = provider::kubernetes::manifest_decode_multi(file("manifests/argocd-install-v2.13.3.yaml"))
}

resource "kubernetes_manifest" "argocd_install" {
  for_each = {
    for manifest in local.install_manifests :
    "${manifest.kind}--${manifest.metadata.name}" => manifest
  }  
  manifest = each.value
  depends_on = [ kubernetes_namespace.argocd ]
}

###

# Cannot be used because the yaml file is multidoc
# resource "kubernetes_manifest" "argocd_install" {
#     manifest = yamldecode(file("manifests/argocd-install-v2.13.3.yaml"))
# }

# Multiple files in a folder to be applied
# resource "kubernetes_manifest" "manifests" {
#   for_each = fileset("test/", "*.yaml")
#   manifest = yamldecode(file("test/${each.value}"))
# }

# output "argocd_server_url" {
#   value       = "http://${kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].hostname}"
#   description = "The URL of the ArgoCD server."
# }


# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode
