output "ca" { value = "${ tls_self_signed_cert.ca_cert.cert_pem }" }
output "ca_key" { value = "${ tls_private_key.ca_key.private_key_pem }" }

output "apiserver" { value = "${ tls_locally_signed_cert.apiserver_cert.cert_pem}" }
output "apiserver_key" { value = "${ tls_private_key.apiserver_key.private_key_pem }" }

output "worker" { value = "${ tls_locally_signed_cert.worker_cert.cert_pem}" }
output "worker_key" { value = "${ tls_private_key.worker_key.private_key_pem}" }

output "client" { value = "${ tls_locally_signed_cert.client_cert.cert_pem }"}
output "client_key" { value = "${ tls_private_key.client_key.private_key_pem }"}

resource "null_resource" "certs_to_disk" {

  provisioner "local-exec" {
    command = <<EOF
    echo "${ tls_self_signed_cert.ca_cert.cert_pem }" > ca.crt
    echo "${ tls_private_key.ca_key.private_key_pem }" > ca.key
    echo "${ tls_locally_signed_cert.apiserver_cert.cert_pem}" > apiserver.crt
    echo "${ tls_private_key.apiserver_key.private_key_pem }" > apiserver.key
    echo "${ tls_locally_signed_cert.worker_cert.cert_pem}" > worker.crt
    echo "${ tls_private_key.worker_key.private_key_pem}" > worker.key
    echo "${ tls_locally_signed_cert.client_cert.cert_pem }" > client.crt
    echo "${ tls_private_key.client_key.private_key_pem }" > client.key 
    echo "${ data.template_file.known_tokens_csv.rendered }" > basic_auth.csv
    echo "${ data.template_file.basic_auth_csv.rendered }" > known_tokens.csv
    echo "${ data.template_file.kubelet_kubeconfig.rendered }" > kubeconfig_auth
EOF
  }


}
  
