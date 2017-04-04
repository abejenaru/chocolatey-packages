$packageName    = 'minishift'
$url64          = 'https://github.com/minishift/minishift/releases/download/v1.0.0-rc.1/minishift-1.0.0-rc.1-windows-amd64.zip'
$checksum64     = '{checksum}'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
