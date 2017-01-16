$packageName    = 'kubernetes-cli'
$packageVersion = '1.5.2'
$url            = 'https://dl.k8s.io/v1.5.2/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.5.2/kubernetes-client-windows-amd64.tar.gz'
$checksum       = '3afe8d3ef470e81a4d793539c2a05fbbca9f0710ced1c132b1105469924e3cea'
$checksum64     = 'dbb63c5211d62512b412efcb52d0a394f19a8417f3e5cd153a7f04c619eb5b41'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir    = "$toolsDir\temp"


# Download and unzip into a temp folder
Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -Url64 "$url64" -UnzipLocation "$tempDir" -ChecksumType "$checksumType" -Checksum "$checksum" -ChecksumType64 "$checksumType64" -Checksum64 "$checksum64"

# Untar into tools folder
Get-ChocolateyUnzip -PackageName "$packageName" -FileFullPath "$tempDir" -Destination "$toolsDir"

# Remove temp folder
Remove-Item "$tempDir\*" -recurse
Remove-Item "$tempDir"
