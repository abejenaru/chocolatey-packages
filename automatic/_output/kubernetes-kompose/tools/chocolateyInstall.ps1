$packageName    = 'kubernetes-kompose'
$url64          = 'https://github.com/kubernetes-incubator/kompose/releases/download/v0.3.0/kompose-windows-amd64.exe'
$checksum64     = '5fd0366cec2b90eceed59b6aed4f94c3bb9ad3ce614e5c6454ba58071a973d2b'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\kompose.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Remove tools sub-folders (previous package installations)
$subdirs = Get-ChildItem "$toolsDir" -Directory
foreach ($subdir in $subdirs) {
    Remove-Item "$toolsDir\$subdir" -Recurse
}
