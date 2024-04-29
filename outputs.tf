#output "virtual_machine_ip" {
#  value = vsphere_virtual_machine.vm.default_ip_address
#}
output "vm_ip_addresses" {
  value = [for vm in vsphere_virtual_machine.vm : vm.default_ip_address]
}
