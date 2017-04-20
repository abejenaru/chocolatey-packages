$packageName    = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$url            = '{{DownloadUrl}}'
$url64          = '{{DownloadUrlx64}}'
$checksum       = '{{Checksum}}'
$checksum64     = '{{Checksumx64}}'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


# Download and unzip
Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Url64 "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Don't create shims for any executables
$files = get-childitem "$toolsDir" -include *.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

call google-cloud-sdk\install.bat
