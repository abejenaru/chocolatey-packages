$packageName    = 'kubernetes-kompose'
$url64          = 'https://github.com/kubernetes-incubator/kompose/releases/download/v0.2.0/kompose-windows-amd64.exe'
$checksum64     = '53dc9fcb4b2328bc9c57ec8a465d2dc038a8927845b0a32d4500e5e7d5fb897a'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\kompose.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -ChecksumType64 "$checksumType64" -Checksum64 "$checksum64"

# Remove tools sub-folders (previous package installations)
$subdirs = Get-ChildItem "$toolsDir" -Directory
foreach ($subdir in $subdirs) {
    Remove-Item "$toolsDir\$subdir" -Recurse
}
