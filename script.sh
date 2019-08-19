# =======================================================================================================
# WARNING: Do not delete AzureServicePrincipalResult file
# otherwise next script run without this file will create new SP RBAC
# and destroy current kubernetes cluster :).
# =======================================================================================================
# =======================================================================================================
# Azure CLI login information
# =======================================================================================================
# Example:
# AZ_LOGIN="yaroslav.kasyanov@globallogicmbvservice.onmicrosoft.com"
# AZ_PASSW=  Empty example. Script will ask you to enter password.
# AZ_PASSW="password"
AZ_LOGIN=${AZ_LOGIN:-"admin@ukr.net"}
AZ_PASSW=${AZ_PASSW:-""}
AZ_SUBSCRIPTION_NAME=${AZ_SUBSCRIPTION_NAME:-""}
# Azure Login Response (file where will be saved information after login)
AzureQueryResult="AzureQueryResult"
# Service Principal Response (file where will be saved information after creating role based access control - RBAC)
# Manage Azure Active Directory service principals for automation authentication.
AzureServicePrincipalResult="AzureServicePrincipalResult"

# =======================================================================================================
# Required variables which will be parsed into Terraform file "variables.tf"
# =======================================================================================================
# =======================================================================================================
# Azure resource group & location variables
# =======================================================================================================
azurerm_resource_group_value=${azurerm_resource_group_value:-""}
azure_rg_location_value=${azure_rg_location_value:-""} # Resource region details for (US) : eastus, eastus2, westus, westus2, centralus, northcentralus, southcentralus

# =======================================================================================================
# Azure container registry name where to control private docker registry
# =======================================================================================================
azure_container_registry_name_value=${azure_container_registry_name_value:-""}
# ^ alpha numeric characters only are allowed in "name"

# =======================================================================================================
# */TODO/* Environments
# =======================================================================================================
# env_dev_name_value="dev"
# env_test_name_value="test"
# env_stage_name_value="stage"
# env_prod_name_value="prod"
environment_name_value=${environment_name_value:-""} # actual variable
# ^ It can only be made up of lowercase letters 'a'-'z', the numbers 0-9 and the hyphen.

# =======================================================================================================
# PostgreSQL server information
# =======================================================================================================
postgresql_server_name_value=${postgresql_server_name_value:-""}
# ^ It can only be made up of lowercase letters 'a'-'z', the numbers 0-9 and the hyphen. The hyphen may not lead or trail in the name.
postgresql_server_version_value=${postgresql_server_version_value:-""}
database_admin_user_value=${database_admin_user_value:-""}
database_admin_password_value=${database_admin_password_value:-""}

# =======================================================================================================
# PostgreSQL databases information
# =======================================================================================================
# Databases ConnectionStrings for commonSecrets.yaml in Base64 - automatic from script
# AnalyticsValue= # automatic from script
# DevicesValue= # automatic from script
# FedExIntegrationValue= # automatic from script
# MobileDevicesValue= # automatic from script
# ParcelsValue= # automatic from script
# StationsValue= # automatic from script
# UsersValue= # automatic from script
# VansValue= # automatic from script

# =======================================================================================================
# Azure services
# =======================================================================================================
# BlobStorage_ConnectionString= # automatic from script
# ServiceBus_ConnectionString= # automatic from script

# =======================================================================================================
# Custom services
# =======================================================================================================
FirebaseServerKeyValue=${FirebaseServerKeyValue:-""}
#VaultTokenValue=

# =======================================================================================================
# Kubernetes resourse group & cluster information
# =======================================================================================================
kubernetes_resource_group_value=${kubernetes_resource_group_value:-""}
kubernetes_cluster_name_value=${kubernetes_cluster_name_value:-""}
# ^ The name of the Azure Kubernetes Service cluster.
kubernetes_node_count_value=${kubernetes_node_count_value:-""}
# ^ The number of agents nodes to provision in the cluster
kubernetes_os_type_value=${kubernetes_os_type_value:-""}
kubernetes_version_value=${kubernetes_version_value:-""} # Strongly recomended to use this version "1.12.8"
# ^ https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions#supported-version-list
kubernetes_vm_size_value=${kubernetes_vm_size_value:-""}
# ^ "Standard_DS2_v2" (2 vcpus, 7 GiB memory)
# ^ "Standard_B2ms" (2 vcpus, 8 GiB memory)
# ^ "Standard_F4s" (4 vcpus, 8 GiB memory)
# ^ "Standard_DS3_v2" (4 vcpus, 14 GiB memory)
# kubernetes_client_id_value= automatic from script
# kubernetes_client_secret_value= automatic from script
storage_account_name_value=${storage_account_name_value:-""}
# ^ It must be 3 to 24 characters long, and can contain only lowercase letters and numbers.
# subscription_id_value= automatic from script
# tenant_id_value= automatic from script

# =======================================================================================================
# DNS names information for services
# =======================================================================================================
DNS_ingress=${DNS_ingress:-""}
DNS_dip_dc=${DNS_dip_dc:-""}
# ^ Each DNS name must be in order with each ip in getServicesExternalIps() function
# IParray=($external_ip_ingress $external_ip_dip_dc $external_ip_spa_web);
# ^ DNS names for services. Domain_name_label must contain only lowercase alphanumeric characters, numbers and hyphens. It must start with a letter and end only with a number or letter

# =======================================================================================================
# Required variables for commonconfigs.yaml
# =======================================================================================================
# SFTP information
# =======================================================================================================
# DeployLocalSFTP="true"
# If true will be deployed in kuberenetes and saved in commonconfigs.yaml & commonsecrets.yaml,
# otherwise will be only saved in configs
deployLocalSFTP=${deployLocalSFTP:-"false"}
sftp_Host=${sftp_Host:-""}
# sftp_Port="22" # by default
sftp_Path=${sftp_Path:-""}
sftp_User=${sftp_User:-""}
sftp_Password=${sftp_Password:-""}
# =======================================================================================================
# Users service
# =======================================================================================================
jwt_ExpiryMinutes=${jwt_ExpiryMinutes:-""}
userInactiveForDays=${userInactiveForDays:-""}
userScheduledJob_RunEveryHours=${userScheduledJob_RunEveryHours:-""}
userScheduledJob_RunEveryMinutes=${userScheduledJob_RunEveryMinutes:-""}
userScheduledJob_RunDailyAt=${userScheduledJob_RunDailyAt:-""}
# =======================================================================================================
# Integration FedEx service
# =======================================================================================================
beacon_Host=${beacon_Host:-""}
beacon_Key=${beacon_Key:-""}
beacon_Password=${beacon_Password:-""}
beacon_DeviceID=${beacon_DeviceID:-""}
# =======================================================================================================
# Extract Log Job service
# =======================================================================================================
extractLogJob_RunEveryHours=${extractLogJob_RunEveryHours:-""}
extractLogJob_RunEveryMinutes=${extractLogJob_RunEveryMinutes:-""}
extractLogJob_RunDailyAt=${extractLogJob_RunDailyAt:-""}
# =======================================================================================================
# Registry credentials
# =======================================================================================================
# TODO Experimental
registryCredential=(${registryCredentialEnv:-$registryCredentialEnv}) # Array example : registryCredential=("dev" "test" "stage" "prod")
