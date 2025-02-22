## Command to get credentials to login and utilized the services from azure account

1️⃣ Login to Azure CLI
    --->   az login

2️⃣ Get Subscription & Tenant Information
    --->    az account show --output json

3️⃣ Generate Service Principal for Automation (Optional)
    --->    az ad sp create-for-rbac --name "myServicePrincipal" --role Contributor --scopes /subscriptions/YOUR_SUBSCRIPTION_ID

                OR

    --->    az ad sp create-for-rbac --role Contributor --scopes /subscriptions/<subscription_id> --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"

## This will returns:
        {
            "appId": "xxxx-xxxx-xxxx-xxxx",
            "displayName": "myServicePrincipal",
            "password": "xxxx-xxxx-xxxx",
            "tenant": "xxxx-xxxx-xxxx-xxxx"
        }


                                OR

    {
    "client_id": "f5b6a5cf-fbdf-4a9f-b3b8-3c2cd00225a4",
    "client_secret": "0e760437-bf34-4aad-9f8d-870be799c55d",
    "tenant_id": "72f988bf-86f1-41af-91ab-2d7cd011db47"
    }