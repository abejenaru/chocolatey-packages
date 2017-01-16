$packageName    = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$url            = '{{DownloadUrl}}'
$url64          = '{{DownloadUrlx64}}'
$checksum       = '{{Checksum}}'
$checksum64     = '{{Checksumx64}}'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir    = "$toolsDir\temp"


# Download and unzip into a temp folder
Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -Url64 "$url64" -UnzipLocation "$tempDir" -ChecksumType "$checksumType" -Checksum "$checksum" -ChecksumType64 "$checksumType64" -Checksum64 "$checksum64"

# Untar into tools folder
Get-ChocolateyUnzip -PackageName "$packageName" -FileFullPath "$tempDir" -Destination "$toolsDir"

# Remove temp folder
Remove-Item "$tempDir\*" -recurse
Remove-Item "$tempDir"
