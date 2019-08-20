#!/bin/bash
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
AZ_LOGIN=${AZ_LOGIN:-"yaroslav.kasyanov@coroseyegmail.onmicrosoft.com"}
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

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

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

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
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




#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
echo ${AZ_LOGIN}
echo ${AZ_PASSW}
echo ${AZ_SUBSCRIPTION_NAME}
echo ${azurerm_resource_group_value}
echo ${azure_rg_location_value}
echo ${azure_container_registry_name_value}
echo ${environment_name_value}
echo ${postgresql_server_name_value}
echo ${postgresql_server_version_value}
echo ${database_admin_user_value}
echo ${database_admin_password_value}
echo ${FirebaseServerKeyValue}

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-




