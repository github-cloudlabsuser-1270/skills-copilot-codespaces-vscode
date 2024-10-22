# Import the Azure module
Import-Module Az

# Set the Azure subscription
$subscriptionId = "your-subscription-id"
Set-AzContext -SubscriptionId $subscriptionId

# Define variables
$resourceGroupName = "example-resources"
$storageAccountName = "examplestorageacct"
$location = "West Europe"

# Check if the resource group exists
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    # Create the resource group
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -SkuName "Standard_LRS" -Kind "StorageV2"