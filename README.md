# tf-kind-argocd-docker


To use it you can execute:

```bash
    chmod +x kind/kind-create-cluster.sh
    ./kind/kind-create-cluster.sh
    docker build -t my-node-app:1.0.0 ./node-app
    kind load docker-image my-node-app:1.0.0
    terraform init
    terraform apply -auto-approve
```
