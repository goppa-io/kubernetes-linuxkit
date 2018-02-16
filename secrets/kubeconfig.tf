data "template_file" "kubelet_kubeconfig" {
  template = "${ file( "${ path.module }/kubeconfig" )}"
  vars {
    cluster_endpoint = "certificate-authority-data: ${ base64encode(tls_self_signed_cert.ca_cert.cert_pem) } \n    server: https://master.goppa-internal.io"
    cluster_name = "cluster-goppa-internal"
    cluster_user = "admin-cluster-goppa-internal"
    cluster = "goppa-internal"
    cluster_auth = "client-certificate-data: ${ base64encode(tls_locally_signed_cert.client_cert.cert_pem) } \n    client-key-data: ${ base64encode(tls_private_key.client_key.private_key_pem) }"

  }
}
