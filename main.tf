resource "alicloud_click_house_db_cluster" "cluster" {
  count              = var.create_cluster ? 1 : 0
  db_cluster_version = var.db_cluster_version
  category           = var.category
  db_cluster_class   = var.db_cluster_class
  dynamic "db_cluster_access_white_list" {
    for_each = var.db_cluster_access_white_list
    content {
      db_cluster_ip_array_name = db_cluster_access_white_list.value.db_cluster_ip_array_name
      security_ip_list         = db_cluster_access_white_list.value.security_ip_list
    }
  }

  db_cluster_network_type = "vpc"
  db_cluster_description  = var.db_cluster_description
  db_node_group_count     = var.db_node_group_count
  payment_type            = var.payment_type
  db_node_storage         = var.db_node_storage
  storage_type            = var.storage_type
  vswitch_id              = var.vswitch_id
  encryption_key          = var.encryption_key
  encryption_type         = var.encryption_type
  period                  = var.payment_type == "Subscription" ? var.payment_duration_unit : null
  used_time               = var.payment_type == "Subscription" ? var.payment_duration : null
  status                  = var.status
  maintain_time           = var.maintain_time
  zone_id                 = var.zone_id
  vpc_id                  = var.vpc_id
}

resource "alicloud_click_house_account" "account" {
  count               = var.create_account ? 1 : 0
  db_cluster_id       = local.this_cluster_id
  account_description = var.account_description
  account_name        = var.account_name
  account_password    = var.account_password
  dml_authority       = var.dml_authority
  ddl_authority       = var.ddl_authority
  allow_databases     = var.allow_databases
  total_databases     = var.total_databases
  allow_dictionaries  = var.allow_dictionaries
  total_dictionaries  = var.total_dictionaries
}

