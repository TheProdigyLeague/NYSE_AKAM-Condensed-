# Node.js Web.app GitHub/action
> Node.js Azure_App.srvc
> CI/CD workflow GitHub/action
## Overview
**GitHub Actions** 
+ BuildAI/software_devOps/Workflow
+ Write tasks("actions")
   - Workflows are config/ai.proc
   - Set up in your repository to build, test, package, release, or deploy any project on GitHub.
**GitHub Actions**
+ Build end-to-end continuous integration (CI) and continuous deployment (CD) capabilities directly in your repository. 

### You will:
1. Know how to set up a workflow with GitHub Actions
2. Create a workflow with GitHub Actions to add CI/CD to your Node.Js web app

### Prerequisites
1. You will need a **GitHub** account. [here](https://github.com/join)
2. **Microsoft Azure Account**: [free trial](https://azure.microsoft.com/en-us/free/).
3. Your Windows machine should have [Node.js package manager and NPM](https://nodejs.org/en/download), Visual Studio Code, VS [Azure App Service extension](vscode:extension/ms-azuretools.vscode-azureappservice) installed, to deploy Linux Web Apps on the Azure Platform as a Service (PaaS).
Log into Azure...

### Setting up the GitHub repository

**Node-Express** is an example Node.js web app.
![th](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/4462daf6-cb1e-4b11-8522-ed912c058893)

Clone this repo and open the sample app code in VS Code to get started with this lab.

## Create an Azure App Service
![vs](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/ab801e84-9d06-4ab9-9e04-e597ea0ba7f8)

1. Follow the tutorial [Azure Web Apps Quickstart](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-get-started-nodejs)
2. Click on the `+` icon to create a new app service under your subscription.
3. ~~![](../../assets/images/create-app-service.png)~~ Give your webapp a unique name
4. Select **Linux** as your OS and **Node** as your runtime.
5. Browse to your new site! 

## Set up CI/CD with GitHub Actions 

![gh](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/92f4e3f7-9932-4a05-bca4-58752ed4c8ad)

We'll use GitHub actions to automate our deployment workflow for this web app. 

1. In the portal, Overview page, click on "Get publish profile". A publish profile is a kind of deployment credential, useful when you don't own the Azure subscription. Open the downloaded settings file in VS Code and copy the contents of the file.
~~![](../../assets/images/get-publish-profile.png)~~
2. We will now add the publish profile as a secret associated with this repo. On the GitHub repository, click on the "Settings" tab.
~~![](../../assets/images/github-settings.png)~~
3. Go to "Secrets". Create a new secret called "AZURE_WEBAPP_PUBLISH_PROFILE" and paste the contents from the settings file.
~~![](../../assets/images/create-secret.png)~~
4. Now click on "Actions" in the top bar and create a new workflow.
~~![](../../assets/images/new-action.png)~~
5. Find the **Deploy Node.js to Azure Web App** template and select "Set up this workflow" which creates a new `workflow.yml` file in your repo under `.github/workflows/` folder path
~~![](../../assets/images/node-action.png)~~
Let's get into the details of what this workflow is doing...

- **Workflow Triggers**: Your workflow is set up to run on push events to the branch "master"
     
 ```yaml
  on:
   push:
    branches:
      - master

  ```
For more information, see [Events that trigger workflows](https://help.github.com/articles/events-that-trigger-workflows).
     
- **Setting up Environment Variables:** GitHub action workflows can be parameterized using environment variables. For this workflow, Configure the values for the AZURE_WEBAPP_NAME and leave the defaults as is for AZURE_WEBAPP_PACKAGE_PATH and NODE_VERSION variables     

```yaml
env:
  AZURE_WEBAPP_NAME: your-app-name    # set this to your application's name
  AZURE_WEBAPP_PACKAGE_PATH: '.'      # set this to the path to your web app project, defaults to the repository root
  NODE_VERSION: '10.x'                # set this to the node version to use
```
- **Running your jobs on hosted runners:** GitHub Actions provides hosted runners for Linux, Windows, and macOS. Additionally they announced [Beta-release for self-hosted runners](https://github.blog/2019-11-05-self-hosted-runners-for-github-actions-is-now-in-beta/) which you can checkout if interested.
We specified hosted runner in our workflow as below. 

 ```yaml
jobs:
build-and-deploy:
  name: Build and Deploy
  runs-on: ubuntu-latest
```

- **Using an action**: Actions are reusable units of code that can be built and distributed by anyone on GitHub. To use an action, you must specify the repository that contains the action.
      
```yaml

 steps:
 - uses: actions/checkout@master
 - name: Use Node.js ${{ env.NODE_VERSION }}
   uses: actions/setup-node@v1
   with:
     node-version: ${{ env.NODE_VERSION }}
 
```

- **Running a command**: You can run commands on the job's virtual machine (runner). We are running below NPM commands to install dependencies build, and test our application.

```yaml
 - name: npm install, build, and test
   run: |
     npm install
     npm run build --if-present
     npm run test --if-present

 ```
>For workflow syntax for GitHub Actions see [here](https://help.github.com/en/github/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions)

- **Deploy to Azure web app**: Change the `app-name` to the name of your web app. We are using [GitHub Action to deploy Azure Web App ](https://github.com/Azure/webapps-deploy)to deploy to your Azure Web app with the publish profile stored in GitHub secrets which you created previously.

```yaml
 - name: 'Deploy to Azure WebApp'
   uses: azure/webapps-deploy@v1
   with: 
     app-name: ${{ env.AZURE_WEBAPP_NAME }}
     publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
     package: ${{ env.AZURE_WEBAPP_PACKAGE_PATH }}

```
**For more information on GitHub Actions for Azure, refer to https://github.com/Azure/Actions **
**For more samples to get started with GitHub Action workflows to deploy to Azure, refer to https://github.com/Azure/actions-workflow-samples **
~~![](../../assets/images/add-yaml.png)~~

- Once you're done editing the workflow by configuring the AZURE_WEBAPP_NAME, click on "Start commit". Committing the file will trigger the workflow.
- You can go back to the Actions tab, click on your workflow, and see that the workflow is queued or being deployed. Wait for the job to complete successfully.
~~![](../../assets/images/workflow-complete.png)~~
![gha](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/74120900-cadc-4f35-849f-bc10aee5f8c6)

## Test out your app!

1. Browse your Node app by pasting the URL of your Azure web app: https://AZURE_WEBAPP_NAME.azurewebsites.net
2. Make any text change by editing the node_express/views/index.pug file and commit the change. Browse to the **Actions** tab in GitHub to view the live logs of your Action workflow which got triggered with the push of the commit.
3. Once the workflow successfully completes execution, browse back to your website to visualise the new changes you introduced!
