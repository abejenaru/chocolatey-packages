$packageName    = 'kubernetes-cli'
$packageVersion = '1.6.0'
$url            = 'https://dl.k8s.io/v1.6.0/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.6.0/kubernetes-client-windows-amd64.tar.gz'
$checksum       = '11d5459b0d413a25045c55ce3548d30616ddc2d62451280d3299baa9f3e3e014'
$checksum64     = '84eba6f2b2b82a95397688b1e2ca4deb8d7daf1f8a40919fa0312741ca253799'
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
