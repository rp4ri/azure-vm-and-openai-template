output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "openai_endpoint" {
  value = azurerm_cognitive_account.openai.endpoint
}

output "openai_key" {
  value     = azurerm_cognitive_account.openai.primary_access_key
  sensitive = true
}


output "vm_ssh_private_key" {
  value     = tls_private_key.ssh.private_key_pem
  sensitive = true
}

output "vm_public_ip" {
  value = module.personal-vm.public_ip_address
}