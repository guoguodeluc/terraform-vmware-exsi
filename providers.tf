terraform {
  required_version = ">= 1.8.0"

  required_providers {
    vsphere = {
      source  = "local/hashicorp/vsphere"
#      source  = "hashicorp/vsphere"
      version = ">=2.7.0"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_config["vsphere_user"]
  password       = var.vsphere_config["vsphere_password"]
  vsphere_server = var.vsphere_config["vsphere_server"]

  # 如果使用自签名证书，需要设置此项
  allow_unverified_ssl = true
}
