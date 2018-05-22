#
# VMSS_autoscale.ps1
#https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-scale-up-down



#Get-AzureRmResource -ResourceGroupName <RGname> -ResourceType Microsoft.Compute/VirtualMachineScaleSets

#Get-AzureRmVmss -ResourceGroupName <RGname> -VMScaleSetName <Virtual Machine scale set name>


$subscriptionName="OCC Edulog"
$rg="nststeuagfrgsfc"
$myLocation = "East US"

Connect-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName $subscriptionName

$vmss=Get-AzureRmResource -ResourceGroupName $rg -ResourceType Microsoft.Compute/VirtualMachineScaleSets

$myRuleScaleOut = New-AzureRmAutoscaleRule `
  -MetricName "Percentage CPU" `
  -MetricResourceId $vmss.ResourceId `
  -TimeGrain 00:01:00 `
  -MetricStatistic "Average" `
  -TimeWindow 00:05:00 `
  -Operator "GreaterThan" `
  -Threshold 70 `
  -ScaleActionDirection "Increase" `
  ¨CScaleActionScaleType "PercentChangeCount" `
  -ScaleActionValue 20 `
  -ScaleActionCooldown 00:05:00


  $myRuleScaleIn = New-AzureRmAutoscaleRule `
  -MetricName "Percentage CPU" `
  -MetricResourceId $vmss.ResourceId `
  -Operator "LessThan" `
  -MetricStatistic "Average" `
  -Threshold 30 `
  -TimeGrain 00:01:00 `
  -TimeWindow 00:05:00 `
  -ScaleActionCooldown 00:05:00 `
  -ScaleActionDirection "Decrease" `
  ¨CScaleActionScaleType "PercentChangeCount" `
  -ScaleActionValue 20

  $myScaleProfile = New-AzureRmAutoscaleProfile `
  -DefaultCapacity 5  `
  -MaximumCapacity 10 `
  -MinimumCapacity 5 `
  -Rule $myRuleScaleOut,$myRuleScaleIn `
  -Name "autoprofile"

  Add-AzureRmAutoscaleSetting `
  -Location $myLocation `
  -Name "autosetting" `
  -ResourceGroup $rg `
  -TargetResourceId $vmss.ResourceId `
  -AutoscaleProfile $myScaleProfile