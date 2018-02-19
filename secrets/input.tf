variable "tls_ca_cert_subject_common_name" { default = "kubernetes" }
variable "tls_ca_cert_subject_organization" { default = "Kubernetes" }
variable "tls_ca_cert_subject_locality" { default = "San Francisco" }
variable "tls_ca_cert_subject_province" { default = "California" }
variable "tls_ca_cert_subject_country" { default = "US" }
variable "tls_ca_cert_validity_period_hours" { default = 1000 }
variable "tls_ca_cert_early_renewal_hours" { default = 100 }


variable "tls_client_cert_subject_common_name" { default = "kubecfg" }
variable "tls_client_cert_validity_period_hours" { default = 1000 }
variable "tls_client_cert_early_renewal_hours" { default = 100 }
variable "tls_client_cert_ip_addresses" { default = "127.0.0.1" } 
variable "tls_client_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local" }


variable "tls_apiserver_cert_subject_common_name" { default = "kubernetes-master" }
variable "tls_apiserver_cert_validity_period_hours" { default = 1000 }
variable "tls_apiserver_cert_early_renewal_hours" { default = 100 }
variable "tls_apiserver_cert_ip_addresses" { default = "127.0.0.1,10.11.12.1,10.11.12.254" }
variable "tls_apiserver_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local,*.goppa-internal.io" }


variable "tls_worker_cert_subject_common_name" { default = "kubernetes-worker" }
variable "tls_worker_cert_validity_period_hours" { default = 1000 }
variable "tls_worker_cert_early_renewal_hours" { default = 100 }
variable "tls_worker_cert_ip_addresses" { default = "127.0.0.1" }
variable "tls_worker_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local" }

