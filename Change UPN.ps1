#Replace with the old suffix
$oldSuffix = 'decatur.local'

#Replace with the new suffix
$newSuffix = 'decatursd.com'

#Replace with the OU you want to change suffixes for
$ou = "Ou=Students,DC=decatur,DC=local"

#Replace with the name of your AD server
$server = "DCDNSDHCP-HS.decatur.local"

Get-ADUser -SearchBase $ou -filter * | ForEach-Object {
$newUpn = $_.UserPrincipalName.Replace($oldSuffix,$newSuffix)
$_ | Set-ADUser -server $server -UserPrincipalName $newUpn
}