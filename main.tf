# resource "kubernetes_namespace" "apps" {
#   metadata {
#     name = "apps"
#   }
# }

# resource "kubernetes_deployment" "node_app" {
#   metadata {
#     name = "node-app"
#     namespace = "apps"
#     labels = {
#       app = "node-app"
#     }
#   }

#   spec {
#     replicas = 2

#     selector {
#       match_labels = {
#         app = "node-app"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "node-app"
#         }
#       }

#       spec {
#         container {
#           image = "my-node-app:1.0.0"
#           name  = "node-app"

#           port {
#             container_port = 3000
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "node_service" {
#   metadata {
#     name = "node-app"
#     namespace = "apps"
#   }

#   spec {
#     selector = {
#       app = "node-app"
#     }

#     port {
#       protocol    = "TCP"
#       port        = 80
#       target_port = 3000
#     }

#     type = "NodePort"
#   }
# }

# Multiple files in a folder to be applied
# resource "kubernetes_manifest" "manifests" {
#   for_each = fileset("manifests/", "*.yaml")
#   manifest = yamldecode(file("manifests/${each.value}"))
# }