$packageName    = '{{PackageName}}'
$url64          = '{{DownloadUrl}}'
$checksum64     = '{{Checksum}}'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
