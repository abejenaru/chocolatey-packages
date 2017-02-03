$packageName    = 'freac.portable'
$packageVersion = '1.0.27'
$url            = 'https://sourceforge.net/projects/bonkenc/files/freac/1.0.27/freac-1.0.27-bin.zip/download'
$checksum       = '0f983c2dc4107dc8bc11c027a81c365502e1e735638c7c433ce1e80527da0068'
$checksumType   = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -UnzipLocation "$toolsDir" -ChecksumType "$checksumType" -Checksum "$checksum"

$files = get-childitem "$toolsDir" -include *.exe -exclude freac*.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
