# data "terraform_remote_state" "eks" {
#   backend = "s3"

#   config = {
#     bucket          = "interview-prep-paolos-terraform-remote-state"
#     key             = "envs/test/terraform.tfstate"
#     region          = "ap-southeast-1"
#   }
# }

data "aws_eks_cluster" "main" {
  name = "paolos-test-eks-cluster-1"
  # name = data.terraform_remote_state.eks.outputs.cluster_name

}

data "aws_eks_cluster_auth" "main" {
  name = "paolos-test-eks-cluster-1"
}

