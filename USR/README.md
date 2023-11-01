# Azure Web.app
* automate workflows
![Screenshot 2023-10-12 at 22 22 01](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/77d4e519-a432-4b9c-9668-807671304082)

[`Azure/webapps-deploy`](https://github.com/Azure/webapps-deploy) 

[Azure Web Apps](https://azure.microsoft.com/en-us/services/app-service/web/)

[Containers](https://azure.microsoft.com/en-us/services/app-service/containers/).

[`Azure/appservice-settings`](https://github.com/Azure/appservice-settings)
* configure App settings
* connection strings
* JSON syntax, Azure WebApp
![Screenshot 2023-10-12 at 22 18 49](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/1567cc7e-a011-46f4-b9f7-ec8e0a590ea8)

## User /Workflows/
![Screenshot 2023-10-12 at 22 19 10](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/569b6574-66c6-4808-b041-94d6558032f7)

### Github Dependencies.dll
![Screenshot 2023-10-12 at 22 19 18](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/c3dc14c3-388c-4a8f-88d4-cb1dceddac8c)

* /repo/Checkout_Repo/Actions.git
[Checkout](https://github.com/actions/checkout)
* Authenticate
[Azure Web App Publish Profile](https://github.com/projectkudu/kudu/wiki/Deployment-credentials#site-credentials-aka-publish-profile-credentials) or [Azure Login](https://github.com/Azure/login)
* To build app code in a specific language based environment, use setup actions 
[Setup DotNet](https://github.com/actions/setup-dotnet)
* cache node - npm by version spec and add to PATH
[Setup Node](https://github.com/actions/setup-node)
* env.py --install PATH
[Setup Python](https://github.com/actions/setup-python)
* Java.app \env --vL '&&' cache _VERSION_ ++PATH
[Setup Java](https://github.com/actions/setup-java)
[Azul's Zulu distribution](http://static.azul.com/zulu/bin/)
* To build and deploy a containerized app
[docker-login](https://github.com/Azure/docker-login)
[Azure Container registry](https://azure.microsoft.com/en-us/services/container-registry/). 
![Screenshot 2023-10-12 at 22 19 29](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/5d4619b4-1b3e-4bdd-b26d-c6274c4a0a10)
usr/login/0auth/token/Actions/workflow/tasks/build/_VERSION_/tags/_container_/.\=|
#### /workflow/template.yml
![Screenshot 2023-10-12 at 22 19 40](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/5d722a42-ec06-484c-b734-fabc1bc1e23a)
##### 0Auth
+ New User
+ Deploy web.app
+ repo/table
[^1] _Fork_Repo_
[Node sample](https://github.com/Azure-Samples/node_express_app)
[^2] README.md
- redirects to Azure portal to create a new Web App for Node.
- required GitHub Repo [secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets).
```
$ update --_workflow_.yml
$ cd `.github/workflows/`
~# web.app --config --commit _MOD
```
+ These steps will trigger new CI/CD workflow in **Actions** tab that builds and deploys _APP_ to --Azure GitHub Actions--

##### App.yml
code workflow:
![Screenshot 2023-10-12 at 22 19 54](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/d18dcaf6-d361-46da-b2ab-99a57cd49ef8)

1. Provision Portal [Azure Web Apps Quickstart](https://docs.microsoft.com/en-us/azure/app-service/overview#next-steps)
2. **workflow/template/table** | based **runtime** app ctrl+c
3. **new workflow.yml** | template PATH: `.github/workflows/`
4. `config requirements` [secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets).
5. `$ update /workflow.yml/` | `folder: .github/workflows/` | `web app config`
6. commit the changes to trigger a new workflow.

|  Runtime | Template |Sample Code|
|------------|---------|---------|
| DotNet     | [dotnet.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/asp.net-webapp-on-azure.yml) | https://github.com/Azure-Samples/dotnet-sample |
| DotNet Core    | [dotnet_core.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/asp.net-core-webapp-on-azure.yml) | https://github.com/Azure-Samples/dotnet_core_sample |
| Node       | [node.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/node.js-webapp-on-azure.yml) | https://github.com/Azure-Samples/node_express_app |
| Java | [java_jar.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/java-jar-webapp-on-azure.yml) |https://github.com/Azure-Samples/java-spring-petclinic |
| Java      | [java_war.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/java-war-webapp-on-azure.yml) |https://github.com/Azure-Samples/Java-application-petstore-ee7|
| Python     | [python.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/python-webapp-on-azure.yml) | https://github.com/Azure-Samples/pythonSample_thecatsaidno|
| DOCKER     | [docker.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/docker-webapp-container-on-azure.yml) | https://github.com/Azure-Samples/Node_express_container|
| DOCKER DotNet Core & SQL | [docker_dotnet_core_sql.yml](https://github.com/Azure/actions-workflow-samples/blob/master/AppService/docker-webapp-container-on-azure.yml) | https://github.com/Azure-Samples/dotnetcore-containerized-sqldb-ghactions|

###### /workflow/build/Deployment/Node.js | \Web.app ---> Azure(cTM) \user \profile

```yaml

+ File: .github/workflows/workflow.yml

on: push

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    # checkout the repo
    - name: 'Checkout Github Action' 
      uses: actions/checkout@master
    
    - name: Setup Node 10.x
      uses: actions/setup-node@v1
      with:
        node-version: '10.x'
    - name: 'npm install, build, and test'
      run: |
        npm install
        npm run build --if-present
        npm run test --if-present
       
    - name: 'Run Azure webapp deploy action using publish profile credentials'
      uses: azure/webapps-deploy@v2
      with: 
        app-name: node-rn
        publish-profile: ${{ secrets.azureWebAppPublishProfile }}
- .portal, .crypto
```
![Screenshot 2023-10-12 at 22 19 54](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/fbcf5ace-e36d-4063-b8bc-0e76f37f936d)

###### Configure deployment credentials:

For any credentials like Azure Service Principal, Publish Profile etc add them as 
[secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) 
In the GitHub repository and then use them in the workflow.

The above example uses app-level credentials i.e., publish profile file for deployment. 

Follow the steps to configure the secret:
  * Download the publish profile for the WebApp from the portal (Get Publish profile option)
  * Define a new secret under your repository settings, Add secret menu
  * Paste the contents for the downloaded publish profile file into the secret's value field
  * Now in the workflow file in your branch: `.github/workflows/workflow.yml` replace the secret for the input `publish-profile:` of the deploy Azure WebApp action (Refer to the example above)
    
###### Sample workflow to build and deploy a Node.js app to Azure WebApp for container using Azure service principal

  * [Azure Login](https://github.com/Azure/login) Login with your Azure credentials for Web app deployment authentication. Once login is done, the next set of Azure actions in the workflow can re-use the same session within the job.

```yaml

on: [push]

name: Linux_Container_Node_Workflow

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    # checkout the repo
    - name: 'Checkout Github Action' 
      uses: actions/checkout@master
    
    - name: 'Login via Azure CLI'
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}
    
    - uses: azure/docker-login@v1
      with:
        login-server: contoso.azurecr.io
        username: ${{ secrets.REGISTRY_USERNAME }}
        password: ${{ secrets.REGISTRY_PASSWORD }}
    
    - run: |
        docker build . -t contoso.azurecr.io/nodejssampleapp:${{ github.sha }}
        docker push contoso.azurecr.io/nodejssampleapp:${{ github.sha }} 
      
    - uses: azure/webapps-deploy@v2
      with:
        app-name: 'node-rnc'
        images: 'contoso.azurecr.io/nodejssampleapp:${{ github.sha }}'
    
    - name: Azure logout
      run: |
        az logout

```
![Screenshot 2023-10-12 at 22 20 05](https://github.com/TheProdigyLeague/NYSE_AKAM/assets/30985576/364ec5da-f465-40e7-aec5-2d7045350cee)

###### config \deploy --cred:
`usr/cred/Azure.Srvc` | `usr/profile/etc`
+ repo.git ▶ .yml, .json, .py 
[secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)

+ User-level credentials i.e., Azure Service Principal for deployment. 
1. Define Secret/vars
2. **Settings** -> **Secrets** -> **New secret**.  Provide a secret variable **Name**, for example 'AZURE_CREDENTIALS'
3. ⮕ [az cli](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
4. cmd/Store/io/value/_Secret_vars
5. Store output as **Value** of *secret* __variable__
 *az ad* command scopes service principal to a specific resource group...
  *{resource-group}* within a specific Azure subscription *{subscription-id}*
   V
```bash  
$ az ad sp create-for-rbac --name "myApp" --role contributor \
                            --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
                            --sdk-auth
                            
  # Replace {subscription-id}, {resource-group} "resource, group, details"
  # The command should output a JSON object similar to this:

  {
    "clientId": "<GUID>",
    "clientSecret": "<GUID>",
    "subscriptionId": "<GUID>",
    "tenantId": "<GUID>",
    (...)
  }
  
```
>Scope:
>Azure/Credentials
>Azure/resource
V
* Details:
 - Web App
  - PATH/resource
    *--scopes* attribute
V
+ script:
 - scope credentials to Web.app of *{app-name}*
```bash
$ az ad sp create-for-rbac --name "myApp" --role contributor \
                            --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Web/sites/{app-name} \
                            --sdk-auth

# Replace {subscription-id}, {resource-group}, and {app-name} with the names of your subscription, resource group, and Azure Web App.
```
Now, in Workflow File in Your Branch: `.github/workflows/workflow.yml` replace 'Secrets' in Azure login action with your secret...
