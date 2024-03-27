#################
# Click House DBCluster
#################
variable "create_cluster" {
  description = "Controls if clickhouse cluster should be created"
  type        = bool
  default     = false
}

variable "db_cluster_access_white_list" {
  description = "(Optional) The whitelist of the clickhouse"
  type = list(object({
    db_cluster_ip_array_name = string
    security_ip_list         = string
  }))
  default = []
}

variable "db_cluster_version" {
  description = "(Required, ForceNew) The DBCluster version. Valid values: 19.15.2.2, 20.3.10.75, 20.8.7.15."
  type        = string
  default     = "22.8.5.29"
}

variable "category" {
  description = "(Required, ForceNew) The Category of DBCluster. Valid values: Basic,HighAvailability."
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "HighAvailability"], var.category)
    error_message = "Allowed values are Basic or HighAvailability."
  }
}

variable "db_cluster_class" {
  description = "(Required, ForceNew) The DBCluster class. According to the category, db_cluster_class has two value ranges: Under the condition that the category is the Basic, Valid values: S4-NEW, S8, S16, S32, S64, S104. Under the condition that the category is the HighAvailability, Valid values: C4-NEW, C8, C16, C32, C64, C104."
  type        = string
  default     = "S8"

  validation {
    condition     = contains(["S4-NEW", "S8", "S16", "S32", "S64", "S104", "C4-NEW", "C8", "C16", "C32", "C64", "C104"], var.db_cluster_class)
    error_message = "Allowed values are S4-NEW, S8, S16, S32, S64, S104, C4-NEW, C8, C16, C32, C64 or C104."
  }
}

variable "db_cluster_description" {
  description = "The DBCluster description."
  type        = string
  default     = ""
}

variable "db_node_group_count" {
  description = "(Required, ForceNew) The db node group count. The number should between 1 and 48."
  type        = number
  default     = 1
}

variable "payment_type" {
  description = "(Required, ForceNew) The payment type of the resource. Valid values: PayAsYouGo,Subscription."
  type        = string
  default     = "PayAsYouGo"

  validation {
    condition     = contains(["PayAsYouGo", "Subscription"], var.payment_type)
    error_message = "Allowed values are PayAsYouGo or Subscription."
  }
}

variable "db_node_storage" {
  description = "(Required, ForceNew) The db node storage."
  type        = string
  default     = ""
}

variable "storage_type" {
  description = "(Required, ForceNew) Storage type of DBCluster. Valid values: cloud_essd, cloud_efficiency, cloud_essd_pl2, cloud_essd_pl3."
  type        = string
  default     = "cloud_essd"

  validation {
    condition     = contains(["cloud_essd", "cloud_efficiency", "cloud_essd_pl2", "cloud_essd_pl3"], var.storage_type)
    error_message = "Allowed values are cloud_essd, cloud_efficiency, cloud_essd_pl2, cloud_essd_pl3."
  }
}

variable "vswitch_id" {
  description = "(Required, ForceNew) The vswitch id of DBCluster."
  type        = string
  default     = ""
}

variable "encryption_key" {
  description = "(Optional, ForceNew) Key management service KMS key ID. It is required when encryption_type is CloudDisk."
  type        = string
  default     = ""
}

variable "encryption_type" {
  description = "(Optional, ForceNew) Currently only supports ECS disk encryption, with a value of CloudDisk, not encrypted when empty."
  type        = string
  default     = null
}

variable "payment_duration_unit" {
  description = "Pre-paid cluster of the pay-as-you-go cycle. It is valid and required when payment_type is `Subscription`. Valid values: `Month`, `Year`."
  type        = string
  default     = "Month"
}

variable "payment_duration" {
  description = "(Optional, ForceNew) The used time of DBCluster. It is valid and required when payment_type is `Subscription`."
  type        = string
  default     = "1"
}

variable "status" {
  description = "(Optional) The status of the resource. Valid values: `Running`,`Creating`,`Deleting`,`Restarting`,`Preparing`."
  type        = string
  default     = null
}
variable "maintain_time" {
  description = "(Optional) The maintenance window of DBCluster. Valid format: `hh:mmZ-hh:mm Z`."
  type        = string
  default     = ""
}
variable "zone_id" {
  description = "(Optional, ForceNew) The zone ID of the instance."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "(Required, ForceNew) The id of the VPC."
  type        = string
  default     = ""
}

#################
# Click House Account
#################
variable "create_account" {
  description = "Controls if clickhouse account should be created"
  type        = bool
  default     = false
}

variable "db_cluster_id" {
  description = "(Required, ForceNew) The db cluster id."
  type        = string
  default     = ""
}

variable "account_description" {
  description = "Account description. May contain Chinese and English characters, lowercase letters, numbers, and underscores (_), the dash (-). Cannot start with http:// and https:// at the beginning. Length is from 2 to 256 characters."
  type        = string
  default     = ""
}

variable "account_name" {
  description = "(Required, ForceNew) Account name: lowercase letters, numbers, underscores, lowercase letter; length no more than 16 characters."
  type        = string
  default     = ""
}

variable "account_password" {
  description = "(Required) The account password: uppercase letters, lowercase letters, lowercase letters, numbers, and special characters (special character! #$%^& author (s):_+-=) in a length of 8-32 bit."
  type        = string
  default     = ""
}

variable "dml_authority" {
  description = "(Optional) Specifies whether to grant DML permissions to the database account. Valid values: `all` and `readOnly,modify`."
  type        = string
  default     = ""
}

variable "ddl_authority" {
  description = "(Optional) Specifies whether to grant DDL permissions to the database account. Valid values: `true` and `false`."
  type        = bool
  default     = null
}

variable "allow_databases" {
  description = "(Optional) The list of databases to which you want to grant permissions. Separate databases with commas (,)."
  type        = string
  default     = ""
}

variable "total_databases" {
  description = "(Optional) The list of all databases. Separate databases with commas (,)."
  type        = string
  default     = ""
}

variable "allow_dictionaries" {
  description = "(Optional) The list of dictionaries to which you want to grant permissions. Separate dictionaries with commas (,)."
  type        = string
  default     = ""
}

variable "total_dictionaries" {
  description = "(Optional) The list of all dictionaries. Separate dictionaries with commas (,)."
  type        = string
  default     = ""
}
