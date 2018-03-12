variable "tls_ca_cert_subject_common_name" { default = "Kubernetes" }
variable "tls_ca_cert_subject_organization" { default = "Kubernetes" }
variable "tls_ca_cert_subject_organization_unit" { default = "CA" }
variable "tls_ca_cert_subject_locality" { default = "San Francisco" }
variable "tls_ca_cert_subject_province" { default = "California" }
variable "tls_ca_cert_subject_country" { default = "US" }
variable "tls_ca_cert_validity_period_hours" { default = 1000 }
variable "tls_ca_cert_early_renewal_hours" { default = 100 }


variable "tls_admin_cert_subject_common_name" { default = "admin" }
variable "tls_admin_cert_subject_locality" { default = "San Francisco" }
variable "tls_admin_cert_subject_organization" { default = "system:masters" }
variable "tls_admin_cert_subject_organization_unit" { default = "Kubernetes" }
variable "tls_admin_cert_subject_province" { default = "California" }
variable "tls_admin_cert_subject_country" { default = "US" }
variable "tls_admin_cert_validity_period_hours" { default = 1000 }
variable "tls_admin_cert_early_renewal_hours" { default = 100 }
variable "tls_admin_cert_ip_addresses" { default = "127.0.0.1" } 
variable "tls_admin_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local" }


variable "tls_master_kubelet_cert_subject_common_name" { default = "system:node:master-node" }
variable "tls_worker_kubelet_cert_subject_common_name" { default = "system:node:worker-node" }
variable "tls_kubelet_cert_subject_locality" { default = "San Francisco" }
variable "tls_kubelet_cert_subject_organization" { default = "system:nodes" }
variable "tls_kubelet_cert_subject_organization_unit" { default = "Kubernetes" }
variable "tls_kubelet_cert_subject_province" { default = "California" }
variable "tls_kubelet_cert_subject_country" { default = "US" }
variable "tls_kubelet_cert_validity_period_hours" { default = 1000 }
variable "tls_kubelet_cert_early_renewal_hours" { default = 100 }
variable "tls_kubelet_cert_ip_addresses" { default = "127.0.0.1" }
variable "tls_kubelet_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local,*.goppa-internal.io" }
            

variable "tls_apiserver_cert_subject_common_name" { default = "kubernetes" }
variable "tls_apiserver_cert_subject_locality" { default = "San Francisco" }
variable "tls_apiserver_cert_subject_organization" { default = "Kubernetes" }
variable "tls_apiserver_cert_subject_organization_unit" { default = "Kubernetes" }
variable "tls_apiserver_cert_subject_province" { default = "California" }
variable "tls_apiserver_cert_subject_country" { default = "US" }
variable "tls_apiserver_cert_validity_period_hours" { default = 1000 }
variable "tls_apiserver_cert_early_renewal_hours" { default = 100 }
variable "tls_apiserver_cert_ip_addresses" { default = "127.0.0.1,10.11.12.1,10.11.12.254" }
variable "tls_apiserver_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local,*.goppa-internal.io" }

variable "tls_proxy_cert_subject_common_name" { default = "system:kube-proxy" }
variable "tls_proxy_cert_subject_locality" { default = "San Francisco" }
variable "tls_proxy_cert_subject_organization" { default = "system:node-proxier" }
variable "tls_proxy_cert_subject_organization_unit" { default = "Kubernetes" }
variable "tls_proxy_cert_subject_province" { default = "California" }
variable "tls_proxy_cert_subject_country" { default = "US" }
variable "tls_proxy_cert_validity_period_hours" { default = 1000 }
variable "tls_proxy_cert_early_renewal_hours" { default = 100 }
variable "tls_proxy_cert_ip_addresses" { default = "127.0.0.1" }
variable "tls_proxy_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local" }

variable "tls_controller_cert_subject_common_name" { default = "system:kube-controller-manager" }
variable "tls_controller_cert_subject_locality" { default = "San Francisco" }
variable "tls_controller_cert_subject_organization" { default = "system:kube-controller-manager" }
variable "tls_controller_cert_subject_organization_unit" { default = "Kubernetes" }
variable "tls_controller_cert_subject_province" { default = "California" }
variable "tls_controller_cert_subject_country" { default = "US" }
variable "tls_controller_cert_validity_period_hours" { default = 1000 }
variable "tls_controller_cert_early_renewal_hours" { default = 100 }
variable "tls_controller_cert_ip_addresses" { default = "127.0.0.1" }
variable "tls_controller_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local" }

variable "tls_scheduler_cert_subject_common_name" { default = "system:kube-scheduler" }
variable "tls_scheduler_cert_subject_locality" { default = "San Francisco" }
variable "tls_scheduler_cert_subject_organization" { default = "system:kube-scheduler" }
variable "tls_scheduler_cert_subject_organization_unit" { default = "Kubernetes" }
variable "tls_scheduler_cert_subject_province" { default = "California" }
variable "tls_scheduler_cert_subject_country" { default = "US" }
variable "tls_scheduler_cert_validity_period_hours" { default = 1000 }
variable "tls_scheduler_cert_early_renewal_hours" { default = 100 }
variable "tls_scheduler_cert_ip_addresses" { default = "127.0.0.1" }
variable "tls_scheduler_cert_dns_names" { default = "kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster.local" }

