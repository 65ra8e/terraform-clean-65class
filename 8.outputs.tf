 

output "instance_external_ip"{
    value = "http://${google_compute_instance.hqseattle-vm.network_interface[0].access_config[0].nat_ip}"
    description = "The external ip address of the GCE instance."
}

output "instance_external_ips" {
  value = {
    vm1 = "http://${google_compute_instance.hqseattle-vm.network_interface[0].access_config[0].nat_ip}"
    vm2 = "http://${google_compute_instance.tokyo-proxy-vm.network_interface[0].access_config[0].nat_ip}"
    # vm3 = "http://${google_compute_instance.myinstance3.network_interface[0].access_config[0].nat_ip}"
  }
  description = "The external ip addresses of the GCE instances."
}