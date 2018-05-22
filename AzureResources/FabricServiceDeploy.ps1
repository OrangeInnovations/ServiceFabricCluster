#https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-creation-via-arm
# FabricServiceDeploy.ps1
#

#$vaultName="myvault"
#$vaultResourceGroupName="myvaultrg"

$resourceGroupLocation="eastus"
$resourceGroupName="nststeuagfrgsfc"
$CertSubjectName="nststeuagfapi.eastus.cloudapp.azure.com"
$certPassword="Password!23" | ConvertTo-SecureString -AsPlainText -Force 
$certOutputFolder="C:\SourceRepo\Navistar\ServiceFabricCluster\AzureResources\certificates\stage"

$parameterFilePath="C:\SourceRepo\Navistar\ServiceFabricCluster\AzureResources\fabric.parameters.json"
$templateFilePath="C:\SourceRepo\Navistar\ServiceFabricCluster\AzureResources\fabric.json"


New-AzureRmServiceFabricCluster -ResourceGroupName $resourceGroupName -CertificateOutputFolder $certOutputFolder -CertificatePassword $certpassword -CertificateSubjectName $CertSubjectName -TemplateFile $templateFilePath -ParameterFile $parameterFilePath
