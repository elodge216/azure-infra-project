@description('Deployment location')
param location string = resourceGroup().location

@description('Environment name (dev or prod)')
param environment string = 'dev'

@description('Project name used for resource naming')
param projectName string = 'infra'

var namePrefix = '${projectName}-${environment}'

var tags = {
  environment: environment
  project: projectName
  deployedBy: 'bicep'
}

module networkModule 'modules/network.bicep' = {
  name: 'networkDeployment'
  params: {
    location: location
    environment: environment
    namePrefix: namePrefix
    tags: tags
  }
}

module storageModule 'modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    location: location
    environment: environment
    namePrefix: namePrefix
    tags: tags
  }
}

module monitoringModule 'modules/monitoring.bicep' = {
  name: 'monitoringDeployment'
  params: {
    location: location
    environment: environment
    namePrefix: namePrefix
    tags: tags
  }
}
