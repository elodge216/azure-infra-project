param location string
param environment string
param namePrefix string
param tags object

var logAnalyticsWorkspaceName = '${namePrefix}-law'

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

output logAnalyticsWorkspaceId string = logAnalyticsWorkspace.id
