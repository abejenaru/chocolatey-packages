$packageName    = 'kubernetes-kompose'
$packageVersion = '0.1.2'
$url            = 'https://github.com/kubernetes-incubator/kompose/releases/download/v0.1.2/kompose_windows-386.tar.gz'
$url64          = 'https://github.com/kubernetes-incubator/kompose/releases/download/v0.1.2/kompose_windows-amd64.tar.gz'
$checksum       = '9a3d066fd29682b469dca610e05f181faec8940d6527ded285df59cc8cc207e6'
$checksum64     = 'f3aec7a1a5130577c94a53c79c8526ec27a576d467702b40bceeb30ba702ff5a'
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
