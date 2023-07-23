# TechChallenge

I have tried to complete all 3 challenges, please go through the respective challenge folder and verify the solution which I have created.

Here is the summary of all three challenges.

- [Challenge 01 - A Three-Tier Architecture for WordPress Web App on Azure](##Challenge-01---A-Three-Tier-Architecture-for-WordPress-Web-App-on-Azure)
- [Challenge 02 - Query the metadata of an instance within AWS or Azure or GCP and provide a JSON-formatted output](#challenge-02---query-the-metadata-of-an-instance-within-aws-or-azure-or-gcp-and-provide-a-json-formatted-output)
- [Challenge 03 - We have a nested object. We would like a function where you pass in the object and a key and get back the value.](#challenge-03---we-have-a-nested-object-we-would-like-a-function-where-you-pass-in-the-object-and-a-key-and-get-back-the-value)


## Challenge 01 - A Three-Tier Architecture for WordPress Web App on Azure

  To Complete this challenge, I have created a 3-Tier architecture of a PHP Web Application deployed to Azure APp service and using SQL Database to store the data of the application.
  
  1. Presentation Tier (Tier 1):
     
      For to make the web app live, I have published the PHP wordpress app to the Azure app service. It includes an Azure App Service named "aibook," for hosting web applications.

  2. Application Tier (Tier 2):
     
      It relies on WordPress software for core functionality such as content management and user authentication. The WordPress app uses an Azure Database for MySQL flexible server named "aibook-5d609391c926459b8d5d3c310f489660-dbserver" to store site data.

  3. Data Tier (Tier 3):
     
      I have utilized Azure MySQL Database, which stores dynamic content, configuration settings, and user data for the website.

  Here is the network architecture of the web app in Azure.
  
  ![image](https://github.com/50ur48h/TechChallenge/assets/130345252/3d585f1f-fd34-42f7-9cbc-b09c3d418d4e)
  
  <br/>
  <br/>
  
---

## Challenge 02 - Query the metadata of an instance within AWS or Azure or GCP and provide a JSON-formatted output

To complete this challenge, I have utilized Azure PowerShell modules to query the various resources from Azure and get their metadata. Below is one example of the query.

 To Fetch all the resource group from a Subscription

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

<br/>
<br/>

---

## Challenge 03 - We have a nested object. We would like a function where you pass in the object and a key and get back the value.

I have created a powershell function to achive this goal. Here is the PowerShell function to get the value from the nested Hashtable.

    function GetValueFromNestedHastable(){
        param(
            [PSObject]
            [Parameter(Mandatory = $true)]
            $Hashtable,
    
            [String]
            [Parameter(Mandatory = $true)]
            $Key
        )
        $keys = $Key.Split('/')
        $Count = 0
        $Value = $Hashtable
    
        while($Count -le $keys.Count-1){
            $key = $keys[$Count]
            $Value = $Value[$key]
            $Count++
        }
        return $Value
    }

  Input Object 1:

    $object = @{“a” = @{“b”= @{“c”=”d”}}}
    $key = "a/b/c"

    # passing these values to function
    GetValueFromNestedHastable -Hashtable $object -Key $key

  Output:
  
    d
