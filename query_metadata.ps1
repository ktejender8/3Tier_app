$respraw=Invoke-WebRequest -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/instance?api-version=2021-01-01"

$respraw

$respraw.content

$respraw.Content | ConvertFrom-Json | ConvertTo-Json -Depth 6

$resp=Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/instance?api-version=2021-01-01"

$respJson = $resp | ConvertTo-Json -Depth 6

$respJson

$resp.network

Write-Output "VM name - $($resp.compute.name), RG - $($resp.compute.resourceGroupName), VM size - $($resp.compute.vmSize)"