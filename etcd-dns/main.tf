data "template_file" "custom_ipxe" {
  count = "3"
  template = "${ file( "${ path.module }/custom_ipxe.yml" )}"
  vars {
    image = "${ var.image }${ count.index + 1}"
  }
}


provider "packet" {
  auth_token = "${var.auth_token}"
}


resource "packet_device" "infra" {
  count            = "3"
  hostname         = "master-node${ count.index + 1 }"
  plan             = "baremetal_0"
  facility         = "ewr1"
  operating_system = "custom_ipxe"
  always_pxe       = "true"
  billing_cycle    = "hourly"
  project_id       = "${ var.packet_project_id }"
  user_data        = "${ element(data.template_file.custom_ipxe.*.rendered, count.index) }"
}


resource "null_resource" "etcd" {
  count = "3"

  provisioner "local-exec" {
    when = "create"
    on_failure = "fail"
    command = <<EOF
    curl -XPUT http://"${ var.etcd_server }"/v2/keys/skydns/io/goppa-internal/"${ element(packet_device.infra.*.hostname, count.index) }" \
    -d value='{"host":"${ element(packet_device.infra.*.access_public_ipv4, count.index) }"}'

    curl -XPUT http://"${ var.etcd_server}"/v2/keys/skydns/io/goppa-internal/_tcp/_etcd-server/"${ element(packet_device.infra.*.hostname, count.index) }" \
    -d value='{"host":"${ element(packet_device.infra.*.hostname, count.index) }.goppa-internal.io","port":2380,"priority":0,"weight":0}'

    curl -XPUT http://"${ var.etcd_server}"/v2/keys/skydns/io/goppa-internal/_tcp/_etcd-client/"${ element(packet_device.infra.*.hostname, count.index) }" \
    -d value='{"host":"${ element(packet_device.infra.*.hostname, count.index) }.goppa-internal.io","port":2379,"priority":0,"weight":0}'

    curl -XPUT http://"${ var.etcd_server }"/v2/keys/skydns/io/goppa-internal/etcd/"${ element(packet_device.infra.*.hostname, count.index) }" \
    -d value='{"host":"${ element(packet_device.infra.*.access_public_ipv4, count.index) }"}'

    curl -XPUT http://"${ var.etcd_server }"/v2/keys/skydns/io/goppa-internal/master/"${ element(packet_device.infra.*.hostname, count.index) }" \
    -d value='{"host":"${ element(packet_device.infra.*.access_public_ipv4, count.index) }"}'

    curl -XPUT http://"${ var.etcd_server }"/v2/keys/skydns/io/goppa-internal/internal-master/"${ element(packet_device.infra.*.hostname, count.index) }" \
    -d value='{"host":"${ element(packet_device.infra.*.access_public_ipv4, count.index) }"}'

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
