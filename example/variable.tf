variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Recovery Services Vault. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
}

variable "recovery_vault_name" {
  description = "(Required) Specifies the name of the Recovery Services Vault. Recovery Service Vault name must be 2 - 50 characters long, start with a letter, contain only letters, numbers and hyphens. Changing this forces a new resource to be created."
  type        = string
}

variable "recovery_vault_sku" {
  description = "(Required) Sets the vault's SKU. Possible values include: Standard, RS0."
  type        = string
}

variable "recovery_vault_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
}

variable "recovery_vault_soft_delete_enabled" {
  description = "(Optional) Is soft delete enable for this Vault? Defaults to true."
  type        = bool
}

variable "recovery_vault_storage_mode_type" {
  description = "(Optional) The storage type of the Recovery Services Vault. Possible values are GeoRedundant, LocallyRedundant and ZoneRedundant. Defaults to GeoRedundant."
  type        = string
}

############################################################# Backup Policy Variabes #############################################################

variable "backup_policy_name" {
  type        = string
  description = " (Required) Specifies the name of the Backup Policy. Changing this forces a new resource to be created."
}

variable "backup_policy_instant_restore_retention_days" {
  type        = number
  description = "(Optional) Specifies the instant restore retention range in days."
  validation {
    condition = (
      var.backup_policy_instant_restore_retention_days >= 1 &&
      var.backup_policy_instant_restore_retention_days <= 5
    )
    error_message = "Number of days must be between 1 and 5."
  }
}

variable "backup_policy_timezone" {
  type        = string
  description = "(Optional) Specifies the timezone. the possible values are defined here. Defaults to UTC"
}

variable "backup_policy_backup_frequency" {
  type        = string
  description = "(Required) Sets the backup frequency. Must be either Daily Weekly Yearly or Monthly."
  validation {
    condition     = contains(["Daily", "Weekly"], var.backup_policy_backup_frequency)
    error_message = "Sets the backup frequency and must one of 'Daily', 'Monthly'."
  }
}

variable "backup_policy_backup_time" {
  type        = string
  description = "(Required) The time of day to perform the backup in 24hour format."
}

variable "backup_policy_backup_weekdays" {
  type        = list(string)
  description = "(Optional) The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."
}

variable "daily_retention" {
  type        = number
  description = " (Required) The number of daily backups to keep. Must be between 7 and 9999."
  validation {
    condition = (
      var.daily_retention >= 7 &&
      var.daily_retention <= 9999
    )
    error_message = "Number of days must be between 7 and 9999."
  }

}

variable "weekly_retention" {
  description = "List of ARM role receivers"
  type = list(object({
    count    = number,      #(Required) The name of the ARM role receiver.
    weekdays = list(string) #(Required) The arm role id.
  }))

}

variable "monthly_retention" {
  description = "List of ARM role receivers"
  type = list(object({
    count    = number       #(Required) The name of the ARM role receiver.
    weekdays = list(string) #(Required) The arm role id.
    weeks    = list(string) #(Required) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.

  }))
}


variable "yearly_retention" {
  description = "List of ARM role receivers"
  type = list(object({
    count    = number       #(Required) The name of the ARM role receiver.
    weekdays = list(string) #(Required) The arm role id.
    weeks    = list(string) #(Required) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last.
    months   = list(string) #(Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November and December.
  }))
}

variable "backup_policy_retention_weekly_count" {
  type        = number
  description = "(Required) The number of weekly backups to keep. Must be between 1 and 5163"
  validation {
    condition = (
      var.backup_policy_retention_weekly_count >= 1 &&
      var.backup_policy_retention_weekly_count <= 5163
    )
    error_message = "Number of days must be between 1 and 5163."
  }
}

variable "backup_policy_retention_weekly_weekdays" {
  type        = list(string)
  description = "(Required) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."

}

variable "backup_policy_retention_monthly_count" {
  type        = number
  description = "(Required) The number of monthly backups to keep. Must be between 1 and 1188"
  validation {
    condition = (
      var.backup_policy_retention_monthly_count >= 1 &&
      var.backup_policy_retention_monthly_count <= 1188
    )
    error_message = "Number of days must be between 1 and 1188."
  }
}

variable "backup_policy_retention_monthly_weekdays" {
  type        = list(string)
  description = "(Required) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."

}

variable "backup_policy_retention_monthly_weeks" {
  type        = list(string)
  description = "(Required) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last."
}

variable "backup_policy_retention_yearly_count" {
  type        = number
  description = "(Required) The number of yearly backups to keep. Must be between 1 and 99"
  validation {
    condition = (
      var.backup_policy_retention_yearly_count >= 1 &&
      var.backup_policy_retention_yearly_count <= 99
    )
    error_message = "Number of days must be between 1 and 99."
  }
}

variable "backup_policy_retention_yearly_weekdays" {
  type        = list(string)
  description = "(Required) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday."

}

variable "backup_policy_retention_yearly_weeks" {
  type        = list(string)
  description = "(Required) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last."
}

variable "backup_policy_retention_yearly_months" {
  type        = list(string)
  description = "(Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November and December."
}

variable "virtual_machine_id" {
  type        = string
  description = "ID of the Virtual Machine"
}
