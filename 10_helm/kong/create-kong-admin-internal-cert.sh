{
NAMESPACE="kong"
kubectl create namespace ${NAMESPACE}
#FreeLicense
kubectl create secret generic kong-enterprise-license --from-literal=license="'{}'" -n ${NAMESPACE}
openssl req -new -x509 -nodes -newkey ec:<(openssl ecparam -name secp384r1) -keyout ./tls.key -out ./tls.crt -days 1095 -subj "/CN=kong_clustering"
kubectl create secret tls kong-cluster-cert --cert=./tls.crt --key=./tls.key -n ${NAMESPACE}
}