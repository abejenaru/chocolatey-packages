$packageName    = 'minishift'
$url64          = 'https://github.com/minishift/minishift/releases/download/v1.0.0-beta.5/minishift-1.0.0-beta.5-windows-amd64.zip'
$checksum64     = '759621e2895a42b785fcd0f9cf7454809cfbd7aec8e2119e1d35b9a378163158'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
