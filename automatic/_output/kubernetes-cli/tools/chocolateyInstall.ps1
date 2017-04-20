$packageName    = 'kubernetes-cli'
$packageVersion = '1.6.2'
$url            = 'https://dl.k8s.io/v1.6.2/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.6.2/kubernetes-client-windows-amd64.tar.gz'
$checksum       = 'a2b0053de6b62d09123d8fcc1927a8cf9ab2a5a312794a858e7b423f4ffdbe3e'
$checksum64     = 'eafdaa29a70d1820be0dc181074c5788127996402bbd5af53b0b765ed244e476'
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
