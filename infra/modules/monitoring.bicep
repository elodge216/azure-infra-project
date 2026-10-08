param location string
param environment string
param namePrefix string
param tags object

var logAnalyticsWorkspaceName = '${namePrefix}-law'
var dataCollectionRuleName = '${namePrefix}-dcr'

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

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2024-03-11' = {
  name: dataCollectionRuleName
  location: location
  tags: tags
  kind: 'Windows'
  properties: {
    dataSources: {
      performanceCounters: [
        {
          name: 'performanceCounters'
          streams: [
            'Microsoft-Perf'
          ]
          samplingFrequencyInSeconds: 60
          counterSpecifiers: [
            '\\Processor(_Total)\\% Processor Time',
            '\\Memory\\Available MBytes'
          ]
        }
      ]
    }
    
    destinations: {
      logAnalytics: [
        {
          name: 'logAnalyticsDestination'
          workspaceResourceId: logAnalyticsWorkspace.id
        }
      ]
    }
  }
}



output logAnalyticsWorkspaceId string = logAnalyticsWorkspace.id
output dataCollectionRuleId string = dataCollectionRule.id
