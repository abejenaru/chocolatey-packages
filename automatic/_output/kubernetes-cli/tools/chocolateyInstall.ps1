$packageName    = 'kubernetes-cli'
$packageVersion = '1.5.3'
$url            = 'https://dl.k8s.io/v1.5.3/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.5.3/kubernetes-client-windows-amd64.tar.gz'
$checksum       = 'fe3136e3c6bd983e55396341c451f896e478e8c9d0b3d1418e1d1fccee3d7b75'
$checksum64     = '8e315cb48135a4ed26585e9d8cf88f550ac51e3658b981bb53cb0952e9b3393a'
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
