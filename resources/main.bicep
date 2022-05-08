param name string
param location string = resourceGroup().location
param suffixes array = [
    '2022'
]
param apiManagementPublisherName string
param apiManagementPublisherEmail string
param functionWorkerRuntimes array = [
    'java'
]
@allowed([
    'Device'
    'ForeignGroup'
    'Group'
    'ServicePrincipal'
    'User'
])
param deploymentScriptPrincipalType string = 'ServicePrincipal'
param deploymentScriptAzureCliVersion string = '2.33.1'

module apim './provision-apimanagement.bicep' = {
    name: 'ApiManagement_main'
    params: {
        name: name
        location: location
        apiMgmtPublisherName: apiManagementPublisherName
        apiMgmtPublisherEmail: apiManagementPublisherEmail
    }
}

module fncapps './provision-functionapp.bicep' = [for (suffix, i) in suffixes: {
    name: 'FunctionApp_main_${suffix}'
    dependsOn: [
        apim
    ]
    params: {
        name: name
        suffix: suffix
        location: location
        consumptionPlanIsLinux: true
        functionWorkerRuntime: functionWorkerRuntimes[i]
    }
}]

module uai './deploymentScript.bicep' = {
    name: 'UserAssignedIdentity_main'
    dependsOn: [
        apim
        fncapps
    ]
    params: {
        name: name
        location: location
        principalType: deploymentScriptPrincipalType
        azureCliVersion: deploymentScriptAzureCliVersion
    }
}
