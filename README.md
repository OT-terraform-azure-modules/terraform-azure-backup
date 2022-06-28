# Azure Virtual Machine Backup Terraform Module

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- This terraform module is used to create virtual machine backup
- This priject is a part of opstree's ot-azure initiative for terraform modules

## Information
Azure Backup provides independent and isolated backups to guard against unintended destruction of the data on your VMs. Backups are stored in a Recovery Services vault with built-in management of recovery points. Configuration and scaling are simple, backups are optimized, and you can easily restore as needed.

As part of the backup process, a snapshot is taken, and the data is transferred to the Recovery Services vault with no impact on production workloads. The snapshot provides different levels of consistency, as described here.

Azure Backup also has specialized offerings for database workloads like SQL Server and SAP HANA that are workload-aware, offer 15 minute RPO (recovery point objective), and allow backup and restore of individual databases.


## Resources Supported

- [Recover Services Vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault)
- [Backup Policy VM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm)
- [Backup Protected VM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_vm)

## Module Usage

```
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# module for azure VM

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "backupVM" {
  source                                       = "./backup"
  recovery_vault_name                          = var.recovery_vault_name
  resource_group_name                          = data.azurerm_resource_group.rg.name
  recovery_vault_sku                           = var.recovery_vault_sku
  backup_policy_name                           = var.backup_policy_name
  backup_policy_instant_restore_retention_days = var.backup_policy_instant_restore_retention_days
  backup_policy_backup_frequency               = var.backup_policy_backup_frequency
  backup_policy_backup_time                    = var.backup_policy_backup_time
  backup_policy_backup_weekdays                = var.backup_policy_backup_weekdays
  daily_retention                              = var.daily_retention
  backup_policy_retention_weekly_count         = var.backup_policy_retention_weekly_count
  backup_policy_retention_weekly_weekdays      = var.backup_policy_retention_weekly_weekdays
  backup_policy_retention_monthly_count        = var.backup_policy_retention_monthly_count
  backup_policy_retention_monthly_weekdays     = var.backup_policy_retention_monthly_weekdays
  backup_policy_retention_monthly_weeks        = var.backup_policy_retention_monthly_weeks
  backup_policy_retention_yearly_count         = var.backup_policy_retention_yearly_count
  backup_policy_retention_yearly_weekdays      = var.backup_policy_retention_yearly_weekdays
  backup_policy_retention_yearly_weeks         = var.backup_policy_retention_yearly_weeks
  backup_policy_retention_yearly_months        = var.backup_policy_retention_yearly_months
  virtual_machine_id                           = var.virtual_machine_id

}
```

Name | Description | Type | Default | Required
-----|-------------|------|---------|:-------:
`resource_group_name` | The name of the resource group in which to create the Recovery Services Vault. Changing this forces a new resource to be created. | string |  | Yes |
`resource_group_location` | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created | string |  | Yes |
`recovery_vault_name` | Specifies the name of the Recovery Services Vault. Recovery Service Vault name must be 2 - 50 characters long, start with a letter, contain only letters, numbers and hyphens. Changing this forces a new resource to be created. | string |  | Yes |
`recovery_vault_sku` | Sets the vault's SKU. Possible values include: Standard, RS0. | string |  | Yes |
`soft_delete_enabled` | Is soft delete enable for this Vault? Defaults to true. | bool | True | No |
`instant_restore_retention_days` | Specifies the instant restore retention range in days.| number |  | No |
`timezone` |Specifies the timezone. the possible values are defined here. Defaults to UTC | string | UTC | No |
`frequency` | Sets the backup frequency. Must be either Daily Weekly Yearly or Monthly. | number |  | Yes |
`time` | The time of day to perform the backup in 24 hour format | string |  | Yes |
`weekdays` | The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday | list |  | No |
`source_vm_id` | The ID of source vm | list |  | No |
`backup_policy_id ` | The ID of backup policy | string |  | Yes |
`virtual_machine_id` | ID of the Virtual Machine | string |  | No |
`backup_policy_retention_yearly_months` | he months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November and December | list |  | Yes |
`backup_policy_retention_yearly_weeks` | he weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last | list |  | Yes |
`backup_policy_retention_yearly_weekdays` | The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday | list | | Yes |
`backup_policy_retention_yearly_count` | The number of yearly backups to keep. Must be between 1 and 99 | number |  | Yes |
`backup_policy_retention_monthly_weeks` | The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last | list |  | Yes |
`backup_policy_retention_monthly_weekdays` | The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday | list |  | Yes |
`backup_policy_retention_monthly_count` | The number of monthly backups to keep. Must be between 1 and 1188 | number |  | Yes |
`backup_policy_retention_weekly_weekdays` | The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday | list |  | Yes |
`backup_policy_retention_weekly_coun` | The number of weekly backups to keep. Must be between 1 and 5163 | number |  | Yes |
`yearly_retention` | List of ARM role receivers | list |  | No |
`monthly_retention` | List of ARM role receivers | list |  | No |
`weekly_retention` | List of ARM role receivers | list |  | No |
`daily_retention` | The number of daily backups to keep. Must be between 7 and 9999 | number |  | Yes |

## Outputs

Name | Description
-----|:----------:
`azurerm_recovery_services_vault_id` | The ID of recovery services vault |
`azurerm_backup_policy_vm_id` | The ID of azure backup policy vm |
`azurerm_backup_protected_vm` | The ID of backup protected vm |


## Contributors

- [@name](link)

