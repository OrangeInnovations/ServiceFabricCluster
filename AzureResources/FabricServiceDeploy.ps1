#https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-creation-via-arm
# FabricServiceDeploy.ps1
#

#$vaultName="myvault"
#$vaultResourceGroupName="myvaultrg"

$resourceGroupLocation="centralus"
$resourceGroupName="OccGeofence-devcluster"
$CertSubjectName="geofencedevcluster"
$certPassword="Password!23" | ConvertTo-SecureString -AsPlainText -Force 
$certOutputFolder="C:\SourceRepo\Navistar\ServiceFabricCluster\AzureResources\certificates\dev"

$parameterFilePath="C:\SourceRepo\Navistar\ServiceFabricCluster\AzureResources\geofencedetectionCluster.parameters.json"
$templateFilePath="C:\SourceRepo\Navistar\ServiceFabricCluster\AzureResources\geofencedetectionCluster.json"


New-AzureRmServiceFabricCluster -ResourceGroupName $resourceGroupName -CertificateOutputFolder $certOutputFolder -CertificatePassword $certpassword -CertificateSubjectName $CertSubjectName -TemplateFile $templateFilePath -ParameterFile $parameterFilePath
