# Define Input Variables
# 1. Azure Location (CentralUS)
# 2. Azure Resource Group Name 
# 3. Azure AKS Environment Name (Dev, QA, Prod)

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "Central US"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type = string
  description = "This variable defines the Resource Group"
  default = "terraform-aks"
}

# Azure AKS Environment Name
variable "environment" {
  type = string  
  description = "This variable defines the Environment"  
  # commented out since this will be provided by AzureDevOps
  #default = "dev2"
}


# AKS Input Variables

# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  # commented out since this will be provided by AzureDevOps
  #default = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"  
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  default = "P@ssw0rd123456"
  description = "This variable defines the Windows admin password k8s Worker nodes"  
}

# PostgreSQL Admin Username
variable "pgsql_admin_username" {
  type = string
  default = "pgsqladmin"
  description = "This variable defines admin username for the PostgreSQL Server"  
}

# PostgreSQL Admin Password
variable "pgsql_admin_password" {
  type = string
  default = "H@Sh1CoR3!1234"
  description = "This variable defines the admin password for the PostgreSQL Server"  
}

