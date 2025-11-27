Terraform module which creates ApsaraDB for ClickHouse resources with `Clickhouse` on Alibaba Cloud.

terraform-alicloud-clickhouse
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-clickhouse/blob/main/README-CN.md)

This module is used to create ApsaraDB for ClickHouse resources with `Clickhouse` on Alibaba Cloud.

These types of resources are supported:

* [alicloud_click_house_db_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/click_house_db_cluster)
* [alicloud_click_house_account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/click_house_account)

## Usage

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Aclickhouse&spm=docs.m.terraform-alicloud-modules.clickhouse&intl_lang=EN_US" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

Create a "PayAsYouGo" instance:

```hcl
module "example" {
  source                  = "terraform-alicloud-modules/clickhouse/alicloud"
  #alicloud_click_house_db_cluster
  create_cluster          = true
  db_cluster_version      = "23.8"
  category                = "Basic"
  db_cluster_class        = "S8"
  db_cluster_network_type = "vpc"
  db_cluster_description  = "tf-test-clickhouse"
  db_node_group_count     = 1
  payment_type            = "PayAsYouGo"
  db_node_storage         = "500"
  storage_type            = "cloud_essd"
  vswitch_id              = "vsw-abc12345"
  #alicloud_click_house_account
  create_account          = true
  account_description     = "tf-test-clickhouse-account"
  account_name            = "testaccountname"
  account_password        = "Tf-testpwd"
  account_type            = "Normal"
}
```

Create a "Subscription" instance：
```hcl
module "example" {
  source                  = "terraform-alicloud-modules/clickhouse/alicloud"
  #alicloud_click_house_db_cluster
  create_cluster          = true
  db_cluster_version      = "23.8"
  category                = "Basic"
  db_cluster_class        = "S8"
  db_cluster_network_type = "vpc"
  db_cluster_description  = "tf-test-clickhouse"
  db_node_group_count     = 1
  payment_type            = "Subscription"
  period                  = "Month"
  used_time               = "1"
  renewal_status          = "Normal"
  db_node_storage         = "500"
  storage_type            = "cloud_essd"
  vswitch_id              = "vsw-abc12345"
  #alicloud_click_house_account
  create_account          = true
  account_description     = "tf-test-clickhouse-account"
  account_name            = "testaccountname"
  account_password        = "Tf-testpwd"
  account_type            = "Normal"
}
```

Create a instance with a multi-zone setup:
```hcl
module "example_multi_zone" {
  source = "terraform-alicloud-modules/clickhouse/alicloud"

  #alicloud_click_house_db_cluster
  create_cluster               = true
  db_cluster_version           = "23.8"
  category                     = "HighAvailability"
  db_cluster_class             = "C8"
  db_cluster_description       = "tf-test-clickhouse"
  db_node_group_count          = 1
  payment_type                 = "PayAsYouGo"
  db_node_storage              = "500"
  storage_type                 = "cloud_essd"
  vswitch_id                   = "primary-vswitch-id"
  multi_zone_vswitch_list = [
    {
      zone_id = "backup-zone-id-1"
      vswitch_id = "backup-vswitch-id-1"
    },
    {
      zone_id = "backup-zone-id-2"
      vswitch_id = "backup-vswitch-id-2"
    }
  ]
  #alicloud_click_house_account
  create_account      = true
  account_description     = "tf-test-clickhouse-account"
  account_name            = "testaccountname"
  account_password        = "Tf-testpwd"
  account_type            = "Normal"
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-clickhouse/tree/master/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.134.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.134.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)

