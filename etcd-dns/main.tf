data "template_file" "custom_ipxe" {
  template = "${ file( "${ path.module }/custom_ipxe.yml" )}"
}

resource "packet_device" "infra0" {
  hostname         = "infra0"
  plan             = "baremetal_1"
  facility         = "ewr1"
  operating_system = "custom_ipxe"
  billing_cycle    = "hourly"
  project_id       = "${ var.packet_project_id }"
  user_data        = "${ data.template_file.custom_ipxe.rendered }"
}


provider "etcd" {
    endpoint = "http://147.75.94.157:2379"
}

# Access a key in Consul
resource "etcd_keys" "dns" {
    key {
        name = "${ packet_device.infra0.hostname }"
        path = "/skydns/io/goppa-internal"
        value = "${ packet_device.infra0.access_private_ipv4 }"
    }
}

