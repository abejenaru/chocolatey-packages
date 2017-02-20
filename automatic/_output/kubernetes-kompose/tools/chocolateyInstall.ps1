$packageName    = 'kubernetes-kompose'
$url64          = 'https://github.com/kubernetes-incubator/kompose/releases/download/v0.2.0/kompose-windows-amd64.exe'
$checksum64     = '43cf92a28a3c94a43a474fd2eaa3285dc4a8448453eff3b7357191db2995e351'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\kompose.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Remove tools sub-folders (previous package installations)
$subdirs = Get-ChildItem "$toolsDir" -Directory
foreach ($subdir in $subdirs) {
    Remove-Item "$toolsDir\$subdir" -Recurse
}
