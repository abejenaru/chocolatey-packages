$packageName    = 'openshift-cli'
$url            = 'https://github.com/openshift/origin/releases/download/v1.5.0/openshift-origin-client-tools-v1.5.0-031cbe4-windows.zip'
$checksum       = 'e4650d9a53678141c17147a98670fc842fc78049762877def4cb66e385aadee7'
$checksumType   = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"
