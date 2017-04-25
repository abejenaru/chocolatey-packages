$packageName    = 'gmkvextractgui'
$url            = 'https://sourceforge.net/projects/gmkvextractgui/files/v1.9.2/gMKVExtractGUI.v1.9.2.7z/download'
$checksum       = '19e9f5ca046a9321092a003ce23cc628fd6fa730df443de61fe7278840bc9a83'
$checksumType   = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -UnzipLocation "$toolsDir" -ChecksumType "$checksumType" -Checksum "$checksum"
