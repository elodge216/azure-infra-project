# Azure Infrastructure Project (Bicep + GitHub Actions)

## Overview

This project deploys a modular Azure infrastructure using Bicep and automates deployment using GitHub Actions.

It includes networking, storage, monitoring, and compute resources, and is designed to mimic a basic cloud environment while showcasing infrastructure-as-code and CI/CD practices.

The solution is parameterized to support multiple environments - dev and prod.

## Live Demo - currently deactivated to reduce cost

Web server deployed via infrastructure code:

http://20.3.123.22

## Architecture

The solution is organized using a main Bicep template that orchestrates deployment by calling modular components.

- **Network module**
  - Virtual Network
  - Subnet
  - Network Security Group (NSG)

- **Storage module**
  - Storage account with globally unique name

- **Monitoring module**
  - Log Analytics workspace for centralized logging

- **Compute module**
  - Windows Virtual Machine
  - Standard SKU Public IP
  - IIS Web Server installed via Custom Script Extension
  - Landing page generated during deployment

Parameters are passed to modules using parameter files for environment-specific deployments.

## Project Structure

```md
infra/
  main.bicep
  main.dev.bicepparam
  main.prod.bicepparam
  modules/
    network.bicep
    storage.bicep
    monitoring.bicep
    compute.bicep
  scripts/
    install-iis.ps1

.github/
  workflows/
    deploy-infra.yml
```

## Deployment

**CI/CD Pipeline**

Infrastructure deployment is automated using GitHub Actions.

- Authenticates to Azure using OIDC (federated identity)
- Deploys Bicep templates to a resource group
- Uses parameter files for environment configuration
- Trigger: Push to main or manual run
- Action: Deploy infrastructure using Bicep

**Manual Deployment (CLI)**

```md
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file infra/main.bicep \
  --parameters infra/main.dev.bicepparam
```

## How It Works

1. GitHub Actions workflow is triggered
2. Workflow authenticates to Azure using federated identity (OIDC)
3. Bicep template deploys infrastructure resources
4. Virtual machine is provisioned
5. Custom Script Extension runs a PowerShell script
6. IIS is installed and a landing page is published

## Design Decisions

- Used Bicep for infrastructure as code to simplify development and improve readability
- Structured the solution using modules for maintainability and reusability
- Used parameter files to support environment-specific deployments
- Used variables for consistent naming and tagging
- Used Standard SKU, static public IP
- Used Custom Script Extension to automate VM configuration
- Used GitHub Actions for CI/CD to simulate real-world deployment workflows
- Used federated identity (OIDC) for secure authentication without storing Azure credentials

## Future Improvements

- Add diagnostic settings and log queries in Log Analytics
- Expand monitoring with alerts
- Replace VM-based hosting with PaaS (App Service or Static Web Apps)
