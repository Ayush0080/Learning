$resourceGroupName="traiinning"
$location="Southeast Asia"
$networkName="tranning"
$addressPrefix="10.0.0.0/16"

New-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName -Location $location -AddressPrefix $addressPrefix
