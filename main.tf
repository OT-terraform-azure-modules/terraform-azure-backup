resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_vault_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_vault_sku
  tags                = var.recovery_vault_tags
  soft_delete_enabled = var.recovery_vault_soft_delete_enabled
}

resource "azurerm_backup_policy_vm" "policy" {
  name                           = var.backup_policy_name
  resource_group_name            = var.resource_group_name
  recovery_vault_name            = azurerm_recovery_services_vault.vault.name
  instant_restore_retention_days = var.backup_policy_instant_restore_retention_days

  timezone = var.backup_policy_timezone

  backup {
    frequency = var.backup_policy_backup_frequency
    time      = var.backup_policy_backup_time
    weekdays  = var.backup_policy_backup_frequency == "Weekly" ? var.backup_policy_backup_weekdays : null
  }

  dynamic "retention_daily" {
    for_each = var.backup_policy_backup_frequency != null && var.backup_policy_backup_frequency == "Daily" ? [var.daily_retention] : []
    content {
      count = var.daily_retention
    }
  }

  dynamic "retention_weekly" {
    for_each = [var.weekly_retention]
    content {
      count    = var.backup_policy_retention_weekly_count
      weekdays = var.backup_policy_retention_weekly_weekdays
    }
  }

  dynamic "retention_monthly" {
    for_each = [var.monthly_retention]
    content {
      count    = var.backup_policy_retention_monthly_count
      weekdays = var.backup_policy_retention_monthly_weekdays
      weeks    = var.backup_policy_retention_monthly_weeks
    }
  }

  dynamic "retention_yearly" {
    for_each = [var.yearly_retention]
    content {
      count    = var.backup_policy_retention_yearly_count
      weekdays = var.backup_policy_retention_yearly_weekdays
      weeks    = var.backup_policy_retention_yearly_weeks
      months   = var.backup_policy_retention_yearly_months
    }
  }
}

resource "azurerm_backup_protected_vm" "vmbackup" {
  count               = length(var.virtual_machine_id)
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  source_vm_id        = var.virtual_machine_id[count.index]
  backup_policy_id    = azurerm_backup_policy_vm.policy.id
}
