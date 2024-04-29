# Terraform Vmware vphere Setup

本项目使用Terraform自动创建VMware exsi 虚机。
只有一台vmware exsi，并且没有加入到vCenter。

## 结构

- `providers.tf` - 定义了Terraform的provider信息。
- `backend.tf` - 包含了状态管理 Backend 远程存储。
- `variables.tf` - 包含了项目使用到的所有变量。
- `main.tf` - 包含了资源的主要配置。 
- `outputs.tf` - 定义了需要输出的信息。

## 创建 Vmware 虚机资源架构
[https://github.com/guoguodeluc/terraform-vmware-exsi/tree/main/images](https://github.com/guoguodeluc/terraform-vmware-exsi/blob/main/images/workflow.jpg)
