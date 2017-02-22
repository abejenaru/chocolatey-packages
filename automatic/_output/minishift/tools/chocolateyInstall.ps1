$packageName    = 'minishift'
$url64          = 'https://github.com/minishift/minishift/releases/download/v1.0.0-beta.4/minishift-1.0.0-beta.4-windows-amd64.zip'
$checksum64     = '6ec37a8bb4e8325213fb175525a14b60c153b3f2d88c0f06aebeae15524aac83'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
