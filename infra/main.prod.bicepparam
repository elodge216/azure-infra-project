using './main.bicep'

param environment = 'prod'
param adminPassword = readEnvironmentVariable('ADMIN_PASSWORD')
