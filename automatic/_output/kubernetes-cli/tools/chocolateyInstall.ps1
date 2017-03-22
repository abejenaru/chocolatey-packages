$packageName    = 'kubernetes-cli'
$packageVersion = '1.5.5'
$url            = 'https://dl.k8s.io/v1.5.5/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.5.5/kubernetes-client-windows-amd64.tar.gz'
$checksum       = 'dff6fe02a6090feb949acc5753633891bcbdb7ecfb2bff3fa132d025713cbd55'
$checksum64     = 'bd7c7c39122135b58da89a700580475a3cadbb31aa1b35175ff2f80067bedc0d'
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
