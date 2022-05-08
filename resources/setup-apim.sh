#!/bin/bash

set -e

# Get artifacts from GitHub
urls=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/justinyoo/Java-App-Autopilot-Sample/releases/latest | jq '.assets[] | { name: .name, url: .browser_download_url }')
apiappzip=$(echo $urls | jq 'select(.name == "apiapp.zip") | .url' -r)

# Deploy function apps
apiapp=$(az functionapp deploy -g rg-$RESOURCE_NAME -n fncapp-$RESOURCE_NAME-api --src-url $apiappzip --type zip)

# Provision APIs to APIM
az deployment group create -n ApiManagement_Api -g rg-$RESOURCE_NAME -u https://raw.githubusercontent.com/justinyoo/Java-App-Autopilot-Sample/main/resources/provision-apiManagementApi.json -p name=$RESOURCE_NAME
