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


echo ${AZ_LOGIN}
echo ${AZ_PASSW}
echo ${AZ_SUBSCRIPTION_NAME}
echo ${AzureQueryResult}
echo ${azurerm_resource_group_value}
echo ${azure_rg_location_value}

