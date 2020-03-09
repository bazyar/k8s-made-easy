#bridge The gaps

kubectl get rolebindings,clusterrolebindings   --all-namespaces    -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SUBJECT:subjects[].name,Role:roleRef.name'
