param location string
param environment string
param namePrefix string
param tags object

var storageAccountName = 'st${uniqueString(resourceGroup().id, environment)}'

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageId string = storage.id
