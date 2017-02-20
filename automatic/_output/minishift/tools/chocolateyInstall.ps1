$packageName    = 'minishift'
$url64          = 'https://github.com/minishift/minishift/releases/download/v1.0.0-beta.3/minishift-1.0.0-beta.3-windows-amd64.zip'
$checksum64     = 'b4b1d874cf709c1c91e2a3c2bd3de855189ca32bd19f557c10099c149ea32384'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
