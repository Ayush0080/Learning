$resourceGroupName="traiinning"
$location="Southeast Asia"
$networkName="tranning"
$addressPrefix="10.0.0.0/16"
$subnetAddressPrefix="10.0.0.0/24"
$subnetName="SubnetA"


$subnet=New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $subnetAddressPrefix
New-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName -Location $location -AddressPrefix $addressPrefix -Subnet $subnet