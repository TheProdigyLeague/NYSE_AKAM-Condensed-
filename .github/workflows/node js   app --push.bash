▶node.js | app --push
⮕azure(cTM)
$ AZURE_WEBAPP_usr_pwd
$ %AZURE_WEBAPP_NAME
$ AZURE_WEBAPP_PKG_PATH
$ NODE_VERSION
$ python3
    { import .yml } # start yml project 
_title: Deploy Node App to Azure # azure workflow
~
_tagline: Learn how to create /workflow/ and set up CICD for a Node App deployed to Azure...
~
_description: Point users to a newly created issue and closes the original issue...
~
_template:
  name: node-app
  repo: node-express

# learn akam(cTM)

on:
    push:
            branches:
            - master
env:
    AZURE_WEBAPP_NAME: akam
    AZURE_WEBAPP_PKG_PATH: '.nyse'
    NODE_VERSION: '16.x'
jobs:
    build-and-deploy:
        name: Build and Deploy
        runs-on: ubuntu-16.x
        steps:
        - uses: actions/chckout@v3
        - name: Use Node.js ${{ env.NODE_VERSION }}
      uses: actions/setup-node@v3
      with:
        node-version: ${{ env.NODE_VERSION }}
    - name: npm install, build, and test
      run: |
        # Build and test the project, then
        # deploy to Azure Web App.
        npm install
        npm run build --if-present
        # npm run test --if-present
    - name: 'Deploy to Azure WebApp'
      uses: azure/webapps-deploy@v2
      with: 
        app-name: ${{ env.AZURE_WEBAPP_NAME }}
        publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
        package: ${{ env.AZURE_WEBAPP_PACKAGE_PATH }}

$ runtime: nodejs10

<pre id="output" class="d-inline-block text-left mb-0" style="overflow-y: hidden;"> 
/$$      /$$ /$$           /$$                           /$$                 
<br>| $$$    /$$$|__/          |__/                          |__/                 
<br>| $$$$  /$$$$ /$$ /$$$$$$$  /$$ /$$$$$$$   /$$$$$$        /$$ /$$$$$$$       
<br>| $$ $$/$$ $$| $$| $$__  $$| $$| $$__  $$ /$$__  $$      | $$| $$__  $$       
<br>| $$  $$$| $$| $$| $$  \ $$| $$| $$  \ $$| $$  \ $$      | $$| $$  \ $$       
<br>| $$\  $ | $$| $$| $$  | $$| $$| $$  | $$| $$  | $$      | $$| $$  | $$       
<br>| $$ \/  | $$| $$| $$  | $$| $$| $$  | $$|  $$$$$$$      | $$| $$  | $$       
<br>|__/     |__/|__/|__/  |__/|__/|__/  |__/ \____  $$      |__/|__/  |__/       
<br>                                          /$$  \ $$                           
<br>                                         |  $$$$$$/                           
<br>                                          \______/                            
<br> /$$$$$$$                                                                     
<br>| $$__  $$                                                                    
<br>| $$  \ $$ /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$
<br>| $$$$$$$//$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$_____//$$_____/
<br>| $$____/| $$  \__/| $$  \ $$| $$  \ $$| $$  \__/| $$$$$$$$|  $$$$$$|  $$$$$$ 
<br>| $$     | $$      | $$  | $$| $$  | $$| $$      | $$_____/ \____  $$\____  $$\
<br>| $$     | $$      |  $$$$$$/|  $$$$$$$| $$      |  $$$$$$$ /$$$$$$$//$$$$$$$/
<br>|__/     |__/       \______/  \____  $$|__/       \_______/|_______/|_______/ 
<br>                              /$$  \ $$                                       
<br>                             |  $$$$$$/                                       
<br>                              \______/                                        
<br>                                                                              
<br>                                                                              
<br>                                                                              
<br>                                                                              
<br>                                                                             
<br>                                                                              
<br> /$$ /$$ /$$                                                                 
<br>|__/|__/|__/                                                                  
</pre>
$ sql 
~# [PUSH]
    name: var_sub .json, .xml, '&&' .yml -fs
    
    jobs:
        build:
            runs-on: windows-latest
            steps:
            - uses: msft/vars-sub@v1
            with:
                files: 'app/*.json, app/*.yaml, ./app/usr_pwd/We*.config'~
            env:
                token: "chain"
                block: "crypto"
                SECRET: ${{ secrets.BLOCK_CHAIN}}
$ _ |
name: Deploy Node.js to Azure Web App

on:
  [push]

# CONFIGURATION
# For help, go to https://github.com/Azure/Actions
#
# 1. Set up the following secrets in your repository:
#   AZURE_WEBAPP_PUBLISH_PROFILE
#
# 2. Change these variables for your configuration:
env:
  AZURE_WEBAPP_NAME: your-app-name    # set this to your application's name
  AZURE_WEBAPP_PACKAGE_PATH: '.'      # set this to the path to your web app project, defaults to the repository root
  NODE_VERSION: '16.x'                # set this to the node version to use

jobs:
  build-and-deploy:
    name: Build and Deploy
    runs-on: ubuntu-latest
    environment: dev
    steps:
    - uses: actions/checkout@v3
    - name: Use Node.js ${{ env.NODE_VERSION }}
      uses: actions/setup-node@v3
      with:
        node-version: ${{ env.NODE_VERSION }}
    - name: npm install, build, and test
      run: |
        # Build and test the project, then
        # deploy to Azure Web App.
        npm prune --production
        npm install
        npm run build --if-present
        # npm run test --if-present
    - name: 'Deploy to Azure WebApp'
      uses: azure/webapps-deploy@v2
      with: 
        app-name: ${{ env.AZURE_WEBAPP_NAME }}
        publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
        package: ${{ env.AZURE_WEBAPP_PACKAGE_PATH }}
        
  # For more information on GitHub Actions for Azure, refer to https://github.com/Azure/Actions
  # For more samples to get started with GitHub Action workflows to deploy to Azure, refer to https://github.com/Azure/actions-workflow-samples
