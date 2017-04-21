$packageName    = 'kubernetes-cli'
$packageVersion = '1.4.12'
$url            = 'https://dl.k8s.io/v1.4.12/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.4.12/kubernetes-client-windows-amd64.tar.gz'
$checksum       = 'bdca3096bed1a4c485942ab1d3f9351f5de00962058adefbb5297d50071461d4'
$checksum64     = 'a74934eca20dd2e753d385ddca912e76dafbfff2a65e3e3a1ec3c5c40fd92bc8'
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
