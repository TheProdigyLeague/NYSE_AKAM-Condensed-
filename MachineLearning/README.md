![Screenshot 2023-10-12 at 22 20 50](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/dba553bc-6fe5-4cc6-9e15-d06143870881)
# Serverless Web Application

* Architecture of SWA. Static Angular.JS content.APP from Azure Blob Storage (Static Website), and implements * + REST APIs for CRUD with Azure Functions. 
+ API reader from Cosmos DB and returns the results to Web.app. 
+ Uses Azure Bicep for Infrastructure as Code to deploy and configure Azure resources.

## Workflows

This repo contains three /workflows/ Artifacts, and Bicep files, [here](https://github.com/Azure-Samples/serverless-web-application)

* [Create Azure Resource (IaC)](azure-infra-cicd.yml)
* Workflow Validator.
* File.bicep
* Azure resources
* Host.bicep
* Creates API MGMT, CDN, Cosmos DB*MogolDB, WIN_Function, cryptoKey(Vault), BYO, RAM, Web Host
* [Build and publish .NET](functions-api-cicd.yml) .NET Core application and publish it to Azure Function.
* Imports HTTP Trigger Functions as API's to API Management using Bicep.
* This requires that Functions must be able to generate an OpenAPI specification.
* [Build and publish Angular (SPA)](spa-cicd.yml) workflow build Angular application and publishes it to Azure Storage Account as a static website.
* This workflow will register both client and API applications in Azure Active Directory tenant of your subscription for authentication. It also purges Azure CDN to refresh static web content.
