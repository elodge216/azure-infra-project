# Infrastructure Project

## Overview

This project deploys a modular Azure infrastructure using Bicep. It currently includes modules for network, storage and monitoring, with compute planned. It has been designed to mimic a basic cloud environment.

It is also parameterized to support dev and prod enviroments.

## Architecture

The solution is organized using a main Bicep template that orchestrates deployment by calling the various modules included in the project to deploy individual resources.

- Network module: Deploys a virtual network, subnet, and network security group
- Storage module: Deploys a storage account with a globally unique name
- Monitoring module: Deploys a Log Analytics workspace for centralized logging
- Compute module: In progress

Parameters are passed to the modules via parameter files. Both dev and prod parameter files have been created.

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
    compute.bicep (planned)
```

## Deployment

To deploy the infrastructure:

```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file infra/main.bicep \
  --parameters infra/main.dev.bicepparam
```

## Design Decisions

- Used Bicep for infrastructure as code to simplify development
- Structured the solution using modules to make the infrastructure more customizable and improve maintainability
- Used parameters to enable low effort, environment specific deployments
- Used variables for consistent naming and tagging
- Included a Log Analytics workspace to introduce centralized monitoring

## Future Improvements

- Add a virtual machine with a configured web server
- Introduce CI/CD using GitHub Actions
- Expand monitoring with alerts and diagnostics'
