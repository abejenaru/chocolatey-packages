$packageName    = '{{PackageName}}'
$url            = '{{DownloadUrl}}'
$checksum       = '{{Checksum}}'
$checksumType   = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -UnzipLocation "$toolsDir" -ChecksumType "$checksumType" -Checksum "$checksum"
