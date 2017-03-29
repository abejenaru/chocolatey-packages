$packageName    = 'kubernetes-cli'
$packageVersion = '1.5.6'
$url            = 'https://dl.k8s.io/v1.5.6/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.5.6/kubernetes-client-windows-amd64.tar.gz'
$checksum       = '5a4fdbf0cb88f0e889d8dca1e6c073c167a8c3c7d7b1caad10dbe0dc2eb46677'
$checksum64     = 'b1170a33c5c6fe2c3f71e820f11cf877f0ee72b60a6546aaf989267c89598656'
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
