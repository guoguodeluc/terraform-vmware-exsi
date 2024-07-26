export TF_VAR_vsphere_config='{
  "vsphere_user": "root",
  "vsphere_password": "xxxxxx",
  "vsphere_server": "10.xx.xx.xx/sdk"
}'
export TF_VAR_vm_count=3
export TF_VAR_vm_name_prefix="tf-k8s"
export TF_VAR_vm_cpu=8
export TF_VAR_vm_memory=16384
export TF_VAR_vm_disk_size=50
