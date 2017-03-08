$packageName    = 'kubernetes-cli'
$packageVersion = '1.5.4'
$url            = 'https://dl.k8s.io/v1.5.4/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.5.4/kubernetes-client-windows-amd64.tar.gz'
$checksum       = 'e5ae9775cfe695d2d855b29c01f19b0fd0fad008071d8e95f47f70beb16291a8'
$checksum64     = '40cc26a8216e703217264194b68d6b5af28ffa1b9b48b23232027c5d63d8b28c'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir    = "$toolsDir\temp"


# Download and unzip into a temp folder
Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$tempDir" -Url "$url" -Url64 "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Untar into tools folder
Get-ChocolateyUnzip -PackageName "$packageName" -FileFullPath "$tempDir" -Destination "$toolsDir"

# Remove temp folder
Remove-Item "$tempDir\*" -recurse
Remove-Item "$tempDir"
