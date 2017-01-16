$packageName    = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$url64          = '{{DownloadUrl}}'
$checksum64     = '{{Checksum}}'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\$packageName.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -ChecksumType64 "$checksumType64" -Checksum64 "$checksum64"
