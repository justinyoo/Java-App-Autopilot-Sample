param name string
param location string = resourceGroup().location
param apis array = [
    {
        name: 'java-api'
        displayName: 'Java Function API'
        description: 'Java Function API'
        path: 'java'
        suffix: '2022'
    }
]

module apimapis './apiManagementApi.bicep' = [for api in apis: {
    name: 'ApiManagementApi_${api.path}'
    params: {
        name: name
        location: location
        apiMgmtApiName: api.name
        apiMgmtApiDisplayName: api.displayName
        apiMgmtApiDescription: api.description
        apiMgmtApiPath: api.path
        apiMgmtApiValue: 'https://raw.githubusercontent.com/justinyoo/Java-App-Autopilot-Sample/main/apiapp/swagger.json'
    }
}]