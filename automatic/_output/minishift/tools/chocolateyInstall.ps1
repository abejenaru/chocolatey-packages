$packageName    = 'minishift'
$url64          = 'https://github.com/minishift/minishift/releases/download/v1.0.0-rc.2/minishift-1.0.0-rc.2-windows-amd64.zip'
$checksum64     = 'f68c7dd70865bd260d0b005a25f564522013ceca7685f7e7568f4ab8e0cf5ff9'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
