param location string
param environment string // Not used in this module, but included for consistency across modules and potential future use
param namePrefix string
param tags object
param subnetId string
param adminUsername string
@secure()
param adminPassword string

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${namePrefix}-pip'
  location: location
  tags: tags
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${namePrefix}-nic'
  location: location
  tags: tags
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: '${namePrefix}-vm'
  location: location
  tags: tags
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    osProfile: {
      computerName: '${namePrefix}-vm'
      adminUsername: adminUsername
      adminPassword: adminPassword // Uses a secure parameter
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

resource dscExtension 'Microsoft.Compute/virtualMachines/extensions@2023-03-01' = {
  name: '${vm.name}/dscExtension'
  location: location
  properties: {
    publisher: 'Microsoft.Powershell'
    type: 'DSC'
    typeHandlerVersion: '2.83'
    autoUpgradeMinorVersion: true
    settings: {
      configuration: {
        url: 'https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/application-workloads/iis/iis-install-windowsvm/DSC/IISInstall.ps1.zip'
        script: 'IISInstall.ps1'
        function: 'IISInstall'
      }
    }
  }
}

output publicIpAddress string = publicIp.properties.ipAddress
