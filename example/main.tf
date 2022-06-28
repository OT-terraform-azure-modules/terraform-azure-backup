data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "backupVM" {
  source                                       = "../"
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