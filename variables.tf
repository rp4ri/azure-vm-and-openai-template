# ......... private variables
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

# variable "client_id" {
#   description = "Azure AD application ID"
#   type        = string
# }

# variable "client_secret" {
#   description = "Azure AD application secret"
#   type        = string
#   sensitive   = true
# }

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

# ......... public variables
variable "resource_group_name" {
  description = "Azure resource group name"
  default     = "jex-base-resources"
}

variable "location" {
  description = "Azure location"
  default     = "eastus"
}

variable "vnet_name" {
  description = "Azure virtual network name"
  default     = "jex-base-vnet"
}

variable "subnet_name" {
  description = "Azure subnet name"
  default     = "jex-base-subnet"
}

variable "vm_name" {
  description = "Azure VM name"
  default     = "rodrigo-personal-vm"
}

variable "admin_username" {
  description = "Azure VM admin username"
  default     = "azureuser"
}

variable "openai_name" {
  description = "Azure OpenAI resource name"
  default     = "jex-base-openai"
}
