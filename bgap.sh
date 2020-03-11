#!/bin/bash
# Bridge the gap
case $1 in
  "version")
    echo "1.0.0"
    ;;

  "rbs")
    shift
    kubectl get rolebinding \
    -o custom-columns='Rolebinding:metadata.name,SUBJECT:subjects[].name' "$@"
    ;;

  "cbs")
    shift
    kubectl get clusterrolebindings \
    -o custom-columns='Clusterrolebinding:metadata.name,SUBJECT:subjects[].name' "$@"
    ;;
  "rbcbs")
    shift
    kubectl get rolebinding,clusterrolebindings \
    -o custom-columns='KIND:kind,NAME:metadata.name,SUBJECT:subjects[].name' "$@"
    ;;
  "rbr")
    shift
    kubectl get rolebinding \
    -o custom-columns='Rolebinding:metadata.name,Role:roleRef.name' "$@"
    ;;
  "rbrs")
    shift
    kubectl get rolebinding \
    -o custom-columns='Rolebinding:metadata.name,Role:roleRef.name,SUBJECT:subjects[].name' "$@"
    ;;
  "cbcrs")
    shift
    kubectl get clusterrolebindings \
    -o custom-columns='Clusterrolebinding:metadata.name,Clusterrole:roleRef.name,SUBJECT:subjects[].name' "$@"
    ;;
  "cbcr")
    shift
    kubectl get clusterrolebindings \
    -o custom-columns='Clusterrolebinding:metadata.name,Clusterrole:roleRef.name' "$@"
    ;;
  *)
    kubectl get rolebindings,clusterrolebindings --all-namespaces \
    -o custom-columns='KIND:kind,NAMESPACE:metadata.namespace,NAME:metadata.name,SUBJECT:subjects[].name,Role:roleRef.name'
    ;;
esac