resource "vsphere_virtual_machine" "vm" {
  ## 虚机基础信息
  count                  = var.vm_count
  name                   = "${var.vm_name_prefix}-${count.index + 1 }"

  resource_pool_id       = data.vsphere_host.host.resource_pool_id
  datastore_id           = data.vsphere_datastore.datastore.id
  
  ##  CPU 设置
  num_cpus               = var.vm_cpu
  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true

  ##  内存设置
  memory                 = var.vm_memory
  memory_hot_add_enabled = true

  ## 使用适当的guest ID
  guest_id               = "ubuntu64Guest"
  
  ## 嵌套硬件虚拟化
  nested_hv_enabled          = true

  ## 设置网络,bug:创建多台服务器会出现相同ip地址，暂时未找到解决方式
  wait_for_guest_net_timeout = 2
  wait_for_guest_ip_timeout  = 2
  network_interface {
    network_id = data.vsphere_network.network.id
  }
    

  ## 磁盘名称
  disk {
    label            = "disk0"
    size             = var.vm_disk_size
    thin_provisioned = true
  }
  ##  数据盘
  disk {
    label            = "disk1"
    size             = "100"
    thin_provisioned = true
    unit_number      = 1
  }
  
  ## 使用镜像
  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = var.vm_iso_image
  }
  ## 系统配置,从iso创建系统做配置暂未找到解决方式
}

## data 配置信息
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_host" "host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
