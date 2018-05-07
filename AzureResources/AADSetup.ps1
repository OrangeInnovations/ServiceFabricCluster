#
# AADSetup.ps1
#https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-creation-via-arm

#Download the scripts(http://servicefabricsdkstorage.blob.core.windows.net/publicrelease/MicrosoftAzureServiceFabric-AADHelpers.zip) to your computer.
#Right-click the zip file, select Properties, select the Unblock check box, and then click Apply.
#Extract the zip file.
#Run SetupApplications.ps1, and provide the TenantId, ClusterName, and WebApplicationReplyUrl as parameters. For example:

$context=Get-AzureRmContext
$tenantId  = $context.Tenant.TenantId
$clusterName="tspstagecluster"
$replyUrl="https://" + $clusterName +"tspstagecluster.centralus.cloudapp.azure.com:19000/Explorer/index.html"
.\SetupApplications.ps1 -TenantId $tenantId -ClusterName $clusterName `
	-WebApplicationReplyUrl $replyUrl

#genrate output
#"azureActiveDirectory": {
#  "tenantId":"<guid>",
#  "clusterApplication":"<guid>",
#  "clientApplication":"<guid>"
#}

#use the output to fill parameters aadTenantId, aadClusterApplicationId,aadClientApplicationId in the template parameter file
