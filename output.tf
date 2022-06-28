output "azurerm_recovery_services_vault_id" {
  description = "Id of recovery services vault"
  value       = azurerm_recovery_services_vault.vault.id
}

output "azurerm_backup_policy_vm_id" {
  description = "Id of azure backup policy vm"
  value       = azurerm_backup_policy_vm.policy.id
}

output "azurerm_backup_protected_vm_id" {
  description = "Id of backup protected vm"
  value       = azurerm_backup_protected_vm.vmbackup.id
}