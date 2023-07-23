# Install the Azure PowerShell module if not already installed
Install-Module -Name Az -AllowClobber -Force


# Import the Azure PowerShell module
Import-Module Az

# Connect to your Azure account
Connect-AzAccount

# Get a list of all resource groups
$resourceGroups = Get-AzResourceGroup


# Get a list of all resource groups in a Json format
$resourceGroups = Get-AzResourceGroup | ConvertTo-Json

# Get a list of all resources in a resource groups
$resourceGroups = Get-AzResource -ResourceGroupName AiBook | ConvertTo-Json

# Get a details of any perticular resource 
$resourceGroups = Get-AzResource -Name aibook2f03fc1081 | ConvertTo-Json