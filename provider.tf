provider "kubernetes" {
  config_path = "~/.kube/config"
}

# variable "host" {
#   type = string
# }

# variable "client_certificate" {
#   type = string
# }

# variable "client_key" {
#   type = string
# }

# variable "cluster_ca_certificate" {
#   type = string
# }

# provider "kubernetes" {
#   host = var.host

#   client_certificate     = base64decode(var.client_certificate)
#   client_key             = base64decode(var.client_key)
#   cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
# }
