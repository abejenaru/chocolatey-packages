$packageName    = 'gmkvextractgui'
$url            = 'https://sourceforge.net/projects/gmkvextractgui/files/v1.9.0/gMKVExtractGUI.v1.9.0.7z/download'
$checksum       = 'a4d9897ab2a53bf3ac69146e462875c390af634a8aafb98b8a2f3516d7098883'
$checksumType   = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -UnzipLocation "$toolsDir" -ChecksumType "$checksumType" -Checksum "$checksum"
