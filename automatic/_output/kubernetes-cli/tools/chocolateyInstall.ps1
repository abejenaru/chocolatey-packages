$packageName    = 'kubernetes-cli'
$packageVersion = '1.6.1'
$url            = 'https://dl.k8s.io/v1.6.1/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.6.1/kubernetes-client-windows-amd64.tar.gz'
$checksum       = '306566c6903111769f01b0d05ba66aed63c133501adf49ef8daa38cc6a78097d'
$checksum64     = '5ca89e1672fd29a13a7cb997480216643e98afeba4d19ab081877281d0db8060'
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
