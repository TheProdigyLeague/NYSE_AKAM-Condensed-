# Automate templates
<pre id="output" class="d-inline-block text-left mb-0" style="overflow-y: hidden;">________                         ________                        <br>___  __/________________________ ___  __/___________________ ___ <br>__  /  _  _ \_  ___/_  ___/  __ `/_  /_ _  __ \_  ___/_  __ `__ \<br>_  /   /  __/  /   _  /   / /_/ /_  __/ / /_/ /  /   _  / / / / /<br>/_/    \___//_/    /_/    \__,_/ /_/    \____//_/    /_/ /_/ /_/ </pre>

[Azure(c(TM))](https://www.terraform.io/docs/providers/azurerm/index.html).

## Configure Azure credentials
| -fetch | --cred |
| ------ | ------ |
```sh
az ad sp create-for-rbac --name "myApp" --role contributor \
                            --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
                            --sdk-auth

  # The command should output a JSON object similar to the example below

  {
    "clientId": "<GUID>",
    "clientSecret": "<GUID>",
    "subscriptionId": "<GUID>",
    "tenantId": "<GUID>",
    (...)
  }
```

+ JSON output
+ SECRETS TF_VAR_agent_client_id, TF_VAR_agent_client_secret, TF_VAR_subscription_id, TF_VAR_tenant_id in GitHub repo.
+ For crypto secrets, click! [here](https://docs.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)

Deployment platform Terraform_Actions stored in Terraform_Templates
```
$root dir
$ ^d PATH_Terraform | Action
```
+ Terraform [here](https://www.terraform.io/docs/github-actions/setup-terraform.html)
+ Azure Actions [here](https://github.com/Azure/Actions)

## Terraform Sample Templates

[quick-start templates](https://github.com/Azure/terraform/tree/master/quickstart)

## GitHub Action Workflows

Start! [here](https://github.com/Azure/actions-workflow-samples)