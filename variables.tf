## vmware vsphere 访问信息
variable "vsphere_config" {
  type = map
  description = "vSphere configuration"
  default = {
    vsphere_user     = "root"
    vsphere_password = "vsphere_password"
    vsphere_server   = "vsphere_server"
  }
}

## vsphere 资源信息
variable "vsphere_host" {
  type        = string
  description = "The ESXi host where the VM will be created"
  default     = "esx1.dc.com"
}

variable "vsphere_datacenter" {
  type        = string
  description = "vSphere datacenter name"
  default     = "ha-datacenter"
}

## 存储池
variable "datastore_name" {
  type        = string
  description = "Name of the datastore"
  default     = "datastore1"
}

## 网络信息
variable "network_name" {
  type        = string
  description = "Name of the network"
  default     = "vlan10-dev"
}

## 镜像信息
variable "vm_iso_image" {
  type        = string
  description = "Path to the VM ISO image"
  default     = "images/ubuntu-boot2install-2004-vm-202304171228.iso"
}

## 虚拟机信息
variable "vm_count" {
  type        = number
  description = "Number of virtual machines to create"
  default     = 3
}

variable "vm_name_prefix" {
  type        = string
  description = "List of virtual machine names"
  default     = "terraform"
}

variable "vm_cpu" {
  type        = number
  description = "Number of CPUs for each virtual machine"
  default     = 2
}

variable "vm_memory" {
  type        = number
  description = "Amount of memory (in MB) for each virtual machine"
  default     = 4096
}

variable "vm_disk_size" {
  type        = number
  description = "Size of the disk (in GB) for each virtual machine"
  default     = 20
}
