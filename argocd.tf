resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

locals {
  # provider based function
  install_manifests = provider::kubernetes::manifest_decode_multi(file("argocd/install-manifests/argocd-install-v2.13.3.yaml"))
}

resource "kubernetes_manifest" "argocd_install" {
  for_each = {
    for manifest in local.install_manifests :
    "${manifest.kind}--${manifest.metadata.name}" => manifest
  }  
  manifest = each.value
  depends_on = [ kubernetes_namespace.argocd ]
}

# Multiple files in a folder to be applied
resource "kubernetes_manifest" "manifests" {
  for_each = fileset("argocd/bootstrap-apps/", "*.yaml")
  manifest = yamldecode(file("argocd/bootstrap-apps/${each.value}"))
}