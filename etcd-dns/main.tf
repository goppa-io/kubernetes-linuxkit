data "template_file" "custom_ipxe" {
  template = "${ file( "${ path.module }/custom_ipxe.yml" )}"
}


provider "packet" {
  auth_token = "${var.auth_token}"
}


resource "packet_device" "infra" {
  count            = "3"
  hostname         = "infra${ count.index + 1 }"
  plan             = "baremetal_1"
  facility         = "ewr1"
  operating_system = "custom_ipxe"
  billing_cycle    = "hourly"
  project_id       = "${ var.packet_project_id }"
  user_data        = "${ data.template_file.custom_ipxe.rendered }"
}


resource "null_resource" "etcd" {
  count = "3"

  provisioner "local-exec" {
    when = "create"
    on_failure = "fail"
    command = <<EOF
    curl -XPUT http://"${ var.etcd_server }"/v2/keys/skydns/io/goppa-internal/"${ element(packet_device.infra.*.hostname, count.index) }" \
    -d value='{"host":"${ element(packet_device.infra.*.access_private_ipv4, count.index) }"}'
    curl -XPUT http://"${ var.etcd_server}"/v2/keys/skydns/io/goppa-internal/_tcp/_etcd-server \
    -d value='{"host":"${ element(packet_device.infra.*.hostname, count.index) }"}.goppa-internal.io","port":2380,"priority":0,"weight":0}'
    curl -XPUT http://"${ var.etcd_server}"/v2/keys/skydns/io/goppa-internal/_tcp/_etcd-client \
    -d value='{"host":"${ element(packet_device.infra.*.hostname, count.index) }.goppa-internal.io","port":2379,"priority":0,"weight":0}'
EOF
  }

  provisioner "local-exec" {
    when = "destroy"
    on_failure = "fail"
    command = <<EOF
    curl -L http://"${ var.etcd_server }"/v2/keys/skydns/io/goppa-internal\?recursive\=true -XDELETE
EOF
  }

}
