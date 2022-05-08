param name string
param location string = resourceGroup().location
param apis array = [
    {
        name: 'java-api'
        suffix: 'api'
        displayName: 'Java Function API'
        description: 'Java Function API'
        path: 'java'
    }
]

module apimapis './apiManagementApi.bicep' = [for api in apis: {
    name: 'ApiManagementApi_${api.path}'
    params: {
        name: name
        suffix: api.suffix
        location: location
        apiMgmtApiName: api.name
        apiMgmtApiDisplayName: api.displayName
        apiMgmtApiDescription: api.description
        apiMgmtApiPath: api.path
        apiMgmtApiValue: 'https://raw.githubusercontent.com/justinyoo/Java-App-Autopilot-Sample/main/apiapp/swagger.json'
    }
}]
