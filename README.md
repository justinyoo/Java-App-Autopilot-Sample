# Java App Autopilot Sample #

This provides a sample autopilot feature for serverless Java app on Azure.


## Prerequisites ##

If you want to use the full capacity of the CI/CD pipeline through GitHub Actions, the following GitHub Secrets need to be stored beforehand:

* `AZURE_CREDENTIALS`: Login credentials for Azure CLI to use. For more information how to create this, please refer to [this document](https://github.com/Azure/login#configure-deployment-credentials).
* `AZURE_RESOURCE_NAME`: Resource name of your Azure Functions app instance. All the resource names provisioned onto Azure is based on naming convention. For example, if your resource group is `rg-javaapp` and function app is `fncapp-javaapp-sample`, the `AZURE_RESOURCE_NAME` should be `javaapp`.


## Getting Started &ndash; Autopilot ##

Before changing any codebase, you should have the entire application architecture in a working condition on your Azure subscription. Follow the instruction for it.

1. Click the icon below and follow the instruction on the screen.

    [![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjustinyoo%2FJava-App-Autopilot-Sample%2Fmain%2Fresources%2Fazuredeploy.json)

2. Visit the following URLs to check whether all the apps have been properly provisioned and deployed.

    * `https://apim-<AZURE_RESOURCE_NAME>.azure-api.net/java/ping?name=<YOUR_NAME>`


## Getting Started &ndash; CI/CD Pipeine ##

Once you've got the working system architecture set up, by following the autopilot steps above, now run this CI/CD pipeline.

1. Change a little bit of the codebase.
2. Push the code.
3. Wait for the CI/CD pipeline until it completes whole process for the build, test and deployment to Azure.
4. Find whether the code has been updated or not by hitting the following API endpoint URL.

    * `https://apim-<AZURE_RESOURCE_NAME>.azure-api.net/java/ping?name=<YOUR_NAME>`
