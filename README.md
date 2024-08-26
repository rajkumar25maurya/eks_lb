# to create cluster
sh init.sh dev apply Dev.tfvars

# to create ingress
kubectl apply -f k8s/ns.yaml
kubectl apply -f k8s/ing.yaml
