# Terraform Vmware vphere Setup

本项目使用Terraform自动创建VMware exsi 虚机。
只有一台vmware exsi，并且没有加入到vCenter。

# 版本
terraform 版本： 1.8.0

provider hashicorp/vsphere版本： 2.7.0

# 缓存和配置
## 下载 terraform
```bash
## 安装较新版本 terraform
## https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_linux_amd64.zip
VERSION=1.8.0
wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip
unzip terraform_${VERSION}_linux_amd64.zip 
mv terraform /usr/local/sbin/
## 自动补全
terraform -install-autocomplete
## 查看版本
terraform version
```

## linux 环境变量
```bash
cat > $HOME/.terraformrc <<EOF
plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"
disable_checkpoint = true
EOF
```

## provider 缓存
```bash
## 版本 https://releases.hashicorp.com/terraform-provider-vsphere/
VERSION=2.7.0
wget https://releases.hashicorp.com/terraform-provider-vsphere/${VERSION}/terraform-provider-vsphere_${VERSION}_linux_amd64.zip
mkdir -p ~/.terraform.d/plugins/local/hashicorp/vsphere/${VERSION}/linux_amd64
unzip terraform-provider-vsphere_${VERSION}_linux_amd64.zip -d ~/.terraform.d/plugins/local/hashicorp/vsphere/${VERSION}/linux_amd64
```


## 结构

- `providers.tf` - 定义了Terraform的provider信息。
- `backend.tf` - 包含了状态管理 Backend 远程存储。
- `variables.tf` - 包含了项目使用到的所有变量。
- `main.tf` - 包含了资源的主要配置。 
- `outputs.tf` - 定义了需要输出的信息。

# terraform 应用
## vsphere环境变量
```bash
export TF_VAR_vsphere_config='{
  "vsphere_user": "root",
  "vsphere_password": "xxxxx",
  "vsphere_server": "xx.xx.xx.xx/sdk"
}'
```
## 虚拟机变量信息
```bash
export TF_VAR_vm_count=3
export TF_VAR_vm_name_prefix="tf-k8s"
export TF_VAR_vm_cpu=8
export TF_VAR_vm_memory=16384
export TF_VAR_vm_disk_size=50
```
## 执行terraform
```bash
terraform init
terraform plan
terraform apply
```

## 创建 Vmware 虚机资源架构
![架构](https://github.com/guoguodeluc/terraform-vmware-exsi/blob/main/images/workflow.jpg)
