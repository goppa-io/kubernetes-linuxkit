resource "tls_private_key" "master_kubelet_key" {
  count = "3"
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "tls_private_key" "worker_kubelet_key" {
  count = "3"
  algorithm = "RSA"
  rsa_bits = 2048
}


resource "tls_cert_request" "master_kubelet_csr" {
  count = "3"
  key_algorithm = "${ element( tls_private_key.master_kubelet_key.*.algorithm, count.index )}"
  private_key_pem = "${ element( tls_private_key.master_kubelet_key.*.private_key_pem, count.index )}"
  subject {
    common_name = "${var.tls_master_kubelet_cert_subject_common_name}${ count.index + 1}.goppa-internal.io"
    locality = "${var.tls_kubelet_cert_subject_locality}"
    organization = "${var.tls_kubelet_cert_subject_organization}"
    organizational_unit = "${var.tls_kubelet_cert_subject_organization_unit}"
    province = "${var.tls_kubelet_cert_subject_province}"
    country = "${var.tls_kubelet_cert_subject_country}"
  }

  ip_addresses = [
    "${ split(",", var.tls_kubelet_cert_ip_addresses) }"
  ]

  dns_names = [
    "${ split(",", var.tls_kubelet_cert_dns_names) }"
  ]
}

resource "tls_cert_request" "worker_kubelet_csr" {
  count = "3"
  key_algorithm = "${ element( tls_private_key.worker_kubelet_key.*.algorithm, count.index )}"
  private_key_pem = "${ element( tls_private_key.worker_kubelet_key.*.private_key_pem, count.index )}"
  subject {
    common_name = "${var.tls_worker_kubelet_cert_subject_common_name}${ count.index + 1}.goppa-internal.io"
    locality = "${var.tls_kubelet_cert_subject_locality}"
    organization = "${var.tls_kubelet_cert_subject_organization}"
    organizational_unit = "${var.tls_kubelet_cert_subject_organization_unit}"
    province = "${var.tls_kubelet_cert_subject_province}"
    country = "${var.tls_kubelet_cert_subject_country}"
  }

  ip_addresses = [
    "${ split(",", var.tls_kubelet_cert_ip_addresses) }"
  ]

  dns_names = [
    "${ split(",", var.tls_kubelet_cert_dns_names) }"
  ]
}

resource "tls_locally_signed_cert" "master_kubelet_cert" {
  count = "3"
  cert_request_pem = "${ element( tls_cert_request.master_kubelet_csr.*.cert_request_pem, count.index )}"
  ca_key_algorithm = "${ tls_private_key.ca_key.algorithm }"
  ca_private_key_pem = "${ tls_private_key.ca_key.private_key_pem }"
  ca_cert_pem = "${ tls_self_signed_cert.ca_cert.cert_pem }"
  validity_period_hours = "${ var.tls_kubelet_cert_validity_period_hours }"
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth"
  ]
  early_renewal_hours = "${ var.tls_kubelet_cert_early_renewal_hours }"
}

resource "tls_locally_signed_cert" "worker_kubelet_cert" {
  count = "3"
  cert_request_pem = "${ element( tls_cert_request.worker_kubelet_csr.*.cert_request_pem, count.index )}"
  ca_key_algorithm = "${ tls_private_key.ca_key.algorithm }"
  ca_private_key_pem = "${ tls_private_key.ca_key.private_key_pem }"
  ca_cert_pem = "${ tls_self_signed_cert.ca_cert.cert_pem }"
  validity_period_hours = "${ var.tls_kubelet_cert_validity_period_hours }"
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "client_auth"
  ]
  early_renewal_hours = "${ var.tls_kubelet_cert_early_renewal_hours }"
}

