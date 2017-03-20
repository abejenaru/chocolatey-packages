$packageName    = 'gmkvextractgui'
$url            = 'https://sourceforge.net/projects/gmkvextractgui/files/v1.9.1/gMKVExtractGUI.v1.9.1.7z/download'
$checksum       = '27121eea5f6858cbd006db507f766cadc70d4f75c1b1ac31e95a0035d63a876d'
$checksumType   = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -UnzipLocation "$toolsDir" -ChecksumType "$checksumType" -Checksum "$checksum"
