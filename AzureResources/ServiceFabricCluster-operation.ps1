#
# ServiceFabricCluster_operation.ps1
#

$ConnectArgs = @{  ConnectionEndpoint = 'nststeuagfapi.eastus.cloudapp.azure.com:19000';  X509Credential = $True;  StoreLocation = 'CurrentUser';  StoreName = "MY";   FindType = 'FindByThumbprint';  FindValue = "259BED11340E6E93B2374A32B388F9C501D56A28"   }
Connect-ServiceFabricCluster @ConnectArgs

$vmss=Get-AzureRmVmss -ResourceGroupName 'nststeuagfrgsfc' -VMScaleSetName 'mynt1vm'

Remove-ServiceFabricNodeState -NodeName '_mynt1vm_10' -Force

Remove-ServiceFabricNodeState -NodeName '_mynt1vm_11' -Force

Remove-ServiceFabricNodeState -NodeName '_mynt1vm_12' -Force
Remove-ServiceFabricNodeState -NodeName '_mynt1vm_13' -Force

Remove-ServiceFabricApplication fabric:/OccGeofenceFabric
Unregister-ServiceFabricApplicationType OccGeofenceFabricType 1.0.1

Get-ServiceFabricApplicationHealth fabric:/OccGeofenceFabric -ExcludeHealthStatistics