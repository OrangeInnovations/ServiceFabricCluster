#
# Azure_login.ps1
#
Login-AzureRmAccount;
Add-AzureRmAccount

$subscriptionName="OCC Edulog"
$subscriptionId='0732b52e-6aa9-4098-87e1-c148f2a4f878'
Select-AzureRmSubscription -Subscription $subscriptionName  
Set-AzureRmContext -SubscriptionName $subscriptionName 


Connect-AzureRmAccount
Set-AzureRmContext -SubscriptionId $subscriptionId



#cli
az account list --output table
az account set --subscription $subscriptionName