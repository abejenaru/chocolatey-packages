$packageName    = 'gcloud'
$packageVersion = '152.0.0'
$url            = 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-152.0.0-windows-x86-bundled-python.zip'
$url64          = 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-152.0.0-windows-x86_64-bundled-python.zip'
$checksum       = 'b0c89396f7355465ccb58b6c8e1e57757013b5bde702dbb2bf6ca7b4a97dd695'
$checksum64     = '3044eee4ffda406b1b489ca4a408a1b8375edb0d33a1ee7fe743f8357f4bb75a'
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

& "$toolsDir\google-cloud-sdk\install.bat"
