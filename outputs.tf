# 输出虚拟机的名称和IP地址
output "vm_info" {
  value = { for vm in vsphere_virtual_machine.vm : vm.name => vm.default_ip_address }
  description = "vm name and ip"
}


## output "vm_ip_addresses" {
##   value = [for vm in vsphere_virtual_machine.vm : vm.default_ip_address]
## }
## 
## output "vm_names" {
##   value = [for vm in vsphere_virtual_machine.vm : vm.name]
## }
