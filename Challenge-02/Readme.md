# Challenge 02 - Query the meta data of an instance within AWS or Azure or GCP and provide a JSON formatted output

## 1. Using PowerShell on the local machine to query the metadata of Azure resources
  Azure provides the Azure PowerShell module, which allows us to interact with Azure resources and manage our Azure environment using PowerShell cmdlets. Here's how we can get Azure resource details using PowerShell. TO achieve this we need to follow below steps

1. Install Azure PowerShell Module:
    ```
    Install-Module -Name Az -AllowClobber -Force
    ```
   
2. Connect to Azure account
    ```
   Connect-AzAccount
    ```
Now we are ready to get the details of any Azure resource. Here are a few examples of how we can use PowerShell cmdlets to retrieve details about Azure resources. 
<br/>
<br/>

  <details>
    <summary> Example 1: To get the list of all resource groups in your Azure subscription</summary>
      <div style="max-height: 300px;">
        
         Get-AzResourceGroup
  Output
  
        ResourceGroupName : SampleRG
        Location          : eastus
        ProvisioningState : Succeeded
        Tags              : 
        ResourceId        : /subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/SampleRG
        
        ResourceGroupName : AiBook
        Location          : eastasia
        ProvisioningState : Succeeded
        Tags              : 
        ResourceId        : /subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/AiBook

  
  To Convert This Output to Json, we can append ``` | ConvertTo-Json ``` Command to our main command

       Get-AzResourceGroup -Name AiBook | ConvertTo-Json
  
  Output
  
        [
          {
              "ResourceGroupName":  "SampleRG",
              "Location":  "eastus",
              "ProvisioningState":  "Succeeded",
              "Tags":  {
      
                       },
              "TagsTable":  null,
              "ResourceId":  "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/SampleRG",
              "ManagedBy":  null
          },
          {
              "ResourceGroupName":  "AiBook",
              "Location":  "eastasia",
              "ProvisioningState":  "Succeeded",
              "Tags":  null,
              "TagsTable":  null,
              "ResourceId":  "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/AiBook",
              "ManagedBy":  null
          }
      ]
  </div>
</details>
<br/>
<br/>

<details>
  <summary> Example 2: To get the list of all resources in the resource group</summary>
    <div style="max-height: 300px;">
      
     Get-AzResource -ResourceGroupName AiBook | ConvertTo-Json

  Output

        [
            {
                "ResourceId":  "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/AiBook/providers/Microsoft.DBforMySQL/flexibl
        eServers/aibook-5d609391c926459b8d5d3c310f489660-dbserver",
                "Id":  "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/AiBook/providers/Microsoft.DBforMySQL/flexibleServers
        /aibook-5d609391c926459b8d5d3c310f489660-dbserver",
                "Identity":  null,
                "Kind":  null,
                "Location":  "eastasia",
                "ManagedBy":  null,
                "ResourceName":  "aibook-5d609391c926459b8d5d3c310f489660-dbserver",
                "Name":  "aibook-5d609391c926459b8d5d3c310f489660-dbserver",
                "ExtensionResourceName":  null,
                "ParentResource":  null,
                "Plan":  null,
                "Properties":  null,
                "ResourceGroupName":  "AiBook",
                "Type":  "Microsoft.DBforMySQL/flexibleServers",
                "ResourceType":  "Microsoft.DBforMySQL/flexibleServers",
                "ExtensionResourceType":  null,
                "Sku":  {
                            "Name":  "Standard_B1ms",
                            "Tier":  "Burstable",
                            "Size":  null,
                            "Family":  null,
                            "Model":  null,
                            "Capacity":  null
                        },
                "Tags":  {
                                "Site":  "aibook",
                                "AppProfile":  "Wordpress"
                            },
                "TagsTable":  "\r\nName        Value    \r\n==========  =========\r\nAppProfile  Wordpress\r\nSite        aibook   \r\n",
                "SubscriptionId":  null,
                "CreatedTime":  null,
                "ChangedTime":  null,
                "ETag":  null
            },
            {
                "ResourceId":  "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/AiBook/providers/Microsoft.Web/sites/aibook",
        
                "Id":  "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/AiBook/providers/Microsoft.Web/sites/aibook",
                "Identity":  null,
                "Kind":  "app,linux,container",
                "Location":  "eastasia",
                "ManagedBy":  null,
                "ResourceName":  "aibook",
                "Name":  "aibook",
                "ExtensionResourceName":  null,
                "ParentResource":  null,
                "Plan":  null,
                "Properties":  null,
                "ResourceGroupName":  "AiBook",
                "Type":  "Microsoft.Web/sites",
                "ResourceType":  "Microsoft.Web/sites",
                "ExtensionResourceType":  null,
                "Sku":  null,
                "Tags":  {
                                "Site":  "aibook",
                                "AppProfile":  "Wordpress"
                            },
                "TagsTable":  "\r\nName        Value    \r\n==========  =========\r\nAppProfile  Wordpress\r\nSite        aibook   \r\n",
                "SubscriptionId":  null,
                "CreatedTime":  null,
                "ChangedTime":  null,
                "ETag":  null
            }
        ]


  </div>
</details>
<br/>
<br/>
<br/>

--- 
<br/>
<br/>

## 2. Using Azure Instance Metadata Service (IMDS) within the VM instance

The Azure Instance Metadata Service (IMDS) provides information about currently running virtual machine instances. We can use it to manage and configure your virtual machines. To query the metadata, we can use the Invoke-RestMethod cmdlet to make a request to the IMDS service, which will return the metadata of the virtual machine in a json format. We can only access it from within the VM.

```
# Step 1: Log in to the Virtual machine or VMSS Instace using RDP or SSH
# Step 2: Now we can query this API to get the metadata of this instance
# Here I have used Windows VM to query the metadata

Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | ConvertTo-Json -Depth 64

```


### Here is the output of the API
<br/>

<details>
  <summary>Click here view JSON output</summary>
  <div style="max-height: 300px;">
    
    {
      "compute": {
        "azEnvironment": "AzurePublicCloud",
        "customData": "",
        "evictionPolicy": "",
        "isHostCompatibilityLayerVm": "true",
        "licenseType": "Windows_Client",
        "location": "CentralIndia",
        "name": "Metadat-VM",
        "offer": "windows-11",
        "osProfile": {
          "adminUsername": "azureuser",
          "computerName": "Metadat-VM",
          "disablePasswordAuthentication": ""
        },
        "osType": "Windows",
        "placementGroupId": "",
        "plan": {
          "name": "",
          "product": "",
          "publisher": ""
        },
        "platformFaultDomain": "0",
        "platformUpdateDomain": "0",
        "priority": "",
        "provider": "Microsoft.Compute",
        "publicKeys": [],
        "publisher": "microsoftwindowsdesktop",
        "resourceGroupName": "cloud-shell-storage-centralindia",
        "resourceId": "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/cloud-shell-storage-centralindia/providers/Microsoft.Compute/virtualMachines/Metadat-VM",
        "securityProfile": {
          "secureBootEnabled": "true",
          "virtualTpmEnabled": "true"
        },
        "sku": "win11-22h2-pro",
        "storageProfile": {
          "dataDisks": [],
          "imageReference": {
            "id": "",
            "offer": "windows-11",
            "publisher": "microsoftwindowsdesktop",
            "sku": "win11-22h2-pro",
            "version": "latest"
          },
          "osDisk": {
            "caching": "ReadWrite",
            "createOption": "FromImage",
            "diffDiskSettings": {
              "option": ""
            },
            "diskSizeGB": "127",
            "encryptionSettings": {
              "enabled": "false"
            },
            "image": {
              "uri": ""
            },
            "managedDisk": {
              "id": "/subscriptions/9989455e-f9e2-429f-a316-49ba1a07ed4f/resourceGroups/cloud-shell-storage-centralindia/providers/Microsoft.Compute/disks/Metadat-VM_OsDisk_1_c9c127ed21574edf811ea7a39f73ae7a",
              "storageAccountType": "Premium_LRS"
            },
            "name": "Metadat-VM_OsDisk_1_c9c127ed21574edf811ea7a39f73ae7a",
            "osType": "Windows",
            "vhd": {
              "uri": ""
            },
            "writeAcceleratorEnabled": "false"
          },
          "resourceDisk": {
            "size": "38912"
          }
        },
        "subscriptionId": "9989455e-f9e2-429f-a316-49ba1a07ed4f",
        "tags": "",
        "tagsList": [],
        "userData": "",
        "version": "22621.1992.230708",
        "vmId": "bc3f7a49-0881-4b98-9583-96a1f1345515",
        "vmScaleSetName": "",
        "vmSize": "Standard_B2s",
        "zone": "1"
      },
      "network": {
        "interface": [
          {
            "ipv4": {
              "ipAddress": [
                {
                  "privateIpAddress": "10.1.0.4",
                  "publicIpAddress": ""
                }
              ],
              "subnet": [
                {
                  "address": "10.1.0.0",
                  "prefix": "24"
                }
              ]
            },
            "ipv6": {
              "ipAddress": []
            },
            "macAddress": "000D3A3E382E"
          }
        ]
      }
    }
  </div>
</details>

---
### This is the screenshot from the VM instace where I uery the IMDS API

</div><img width="641" alt="image" src="https://github.com/50ur48h/TechChallenge/assets/130345252/da1c0fd7-e04c-4f32-ba50-2b6d75164bad">
