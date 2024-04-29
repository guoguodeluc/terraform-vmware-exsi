terraform {
    backend "s3" {
        ##  Minio 登录地址和认证信息
        endpoints                   = {
            s3                      = "http://192.168.10.51:9000"
        }
        access_key                  = "LU8CTU9WZ2A2RBM322YG"
        secret_key                  = "RAXM8NAT+9jsfQxy5oWGt4WjziAOxWUj4leNpDR0"

        ##  存放管理状态文件位置
        bucket                      = "terraform"
        key                         = "vwmare/state/terraform.tfstate"

        ## 区域信息
        region                      = "cn-sh-1"

        ## 跳过相关检查和验证
        skip_credentials_validation = true
        skip_requesting_account_id  = true
        skip_metadata_api_check     = true
        skip_region_validation      = true

        ## 启用路径样式 S3 URL（https://<HOST>/<BUCKET> 而不是 https://<BUCKET>.<HOST>, https://developer.hashicorp.com/terraform/language/settings/backends/s3#use_path_style
        use_path_style              = true
    }
}
