output "ca" { value = "${ tls_self_signed_cert.ca_cert.cert_pem }" }
output "ca_key" { value = "${ tls_private_key.ca_key.private_key_pem }" }

output "apiserver" { value = "${ tls_locally_signed_cert.apiserver_cert.cert_pem}" }
output "apiserver_key" { value = "${ tls_private_key.apiserver_key.private_key_pem }" }

output "controller" { value = "${ tls_locally_signed_cert.controller_cert.cert_pem}" }
output "controller_key" { value = "${ tls_private_key.controller_key.private_key_pem }" }

output "scheduler" { value = "${ tls_locally_signed_cert.scheduler_cert.cert_pem}" }
output "scheduler_key" { value = "${ tls_private_key.scheduler_key.private_key_pem }" }

output "proxy" { value = "${ tls_locally_signed_cert.proxy_cert.cert_pem}" }
output "proxy_key" { value = "${ tls_private_key.proxy_key.private_key_pem }" }

output "admin" { value = "${ tls_locally_signed_cert.admin_cert.cert_pem }"}
output "admin_key" { value = "${ tls_private_key.admin_key.private_key_pem }"}

resource "null_resource" "worker_kubelet" {
  count = "3"

  provisioner "local-exec" {
    command = <<EOF
    echo "${ element(split(",", join(",", tls_locally_signed_cert.worker_kubelet_cert.*.cert_pem)), count.index) }" > worker-node"${ count.index +1 }".crt
EOF
  }
}

resource "null_resource" "worker_kubelet_key" {
  count = "3"

  provisioner "local-exec" {
    command = <<EOF
    echo "${ element(split(",", join(",", tls_private_key.worker_kubelet_key.*.private_key_pem)), count.index) }" > worker-node"${ count.index +1 }".key
EOF
  }
}


resource "null_resource" "master_kubelet" {
  count = "3"

  provisioner "local-exec" {
    command = <<EOF
    echo "${ element(split(",", join(",", tls_locally_signed_cert.master_kubelet_cert.*.cert_pem)), count.index) }" > master-node"${ count.index +1 }".crt
EOF
  }
}

resource "null_resource" "master_kubelet_key" {
  count = "3"

  provisioner "local-exec" {
    command = <<EOF
    echo "${ element(split(",", join(",", tls_private_key.master_kubelet_key.*.private_key_pem)), count.index) }" > master-node"${ count.index +1 }".key
EOF
  }
}



resource "null_resource" "certs_to_disk" {

  provisioner "local-exec" {
    command = <<EOF
    echo "${ tls_self_signed_cert.ca_cert.cert_pem }" > ca.crt
    echo "${ tls_private_key.ca_key.private_key_pem }" > ca.key
    echo "${ tls_locally_signed_cert.apiserver_cert.cert_pem}" > apiserver.crt
    echo "${ tls_private_key.apiserver_key.private_key_pem }" > apiserver.key
    echo "${ tls_locally_signed_cert.controller_cert.cert_pem}" > controller.crt
    echo "${ tls_private_key.controller_key.private_key_pem}" > controller.key
    echo "${ tls_locally_signed_cert.scheduler_cert.cert_pem }" > scheduler.crt
    echo "${ tls_private_key.scheduler_key.private_key_pem }" > scheduler.key 
    echo "${ tls_locally_signed_cert.proxy_cert.cert_pem }" > proxy.crt
    echo "${ tls_private_key.proxy_key.private_key_pem }" > proxy.key 
    echo "${ tls_locally_signed_cert.admin_cert.cert_pem }" > admin.crt
    echo "${ tls_private_key.admin_key.private_key_pem }" > admin.key 
    echo "${ data.template_file.known_tokens_csv.rendered }" > basic_auth.csv
    echo "${ data.template_file.basic_auth_csv.rendered }" > known_tokens.csv
    echo "${ data.template_file.kubelet_kubeconfig.rendered }" > kubeconfig_auth
EOF
  }


}
  
