$packageName    = 'kubernetes-cli'
$packageVersion = '1.4.9'
$url            = 'https://dl.k8s.io/v1.4.9/kubernetes-client-windows-386.tar.gz'
$url64          = 'https://dl.k8s.io/v1.4.9/kubernetes-client-windows-amd64.tar.gz'
$checksum       = '16a7224313889d2f98a7d072f328198790531fd0e724eaeeccffe82521ae63b8'
$checksum64     = 'dc19651287701ea6dcbd7b4949db2331468f730e8ebe951de1216f1105761d97'
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
