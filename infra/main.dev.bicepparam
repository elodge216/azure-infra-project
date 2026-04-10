using './main.bicep'

param environment = 'dev'
param adminPassword = readEnvironmentVariable('ADMIN_PASSWORD')
