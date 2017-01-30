$packageName    = '{{PackageName}}'
$url64          = '{{DownloadUrl}}'
$checksum64     = '{{Checksum}}'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\kompose.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -ChecksumType64 "$checksumType64" -Checksum64 "$checksum64"
