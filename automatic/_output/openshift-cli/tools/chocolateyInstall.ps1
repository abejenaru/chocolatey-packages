$packageName    = 'openshift-cli'
$url            = 'https://github.com/openshift/origin/releases/download/v1.4.1/openshift-origin-client-tools-v1.4.1-3f9807a-windows.zip'
$checksum       = '922bc2318685c4ea3518e17099c17ad609529a744fc48231c226f4e1e76d3288'
$checksumType   = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"
