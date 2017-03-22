$packageName    = 'kubernetes-kompose'
$url64          = 'https://github.com/kubernetes-incubator/kompose/releases/download/v0.4.0/kompose-windows-amd64.exe'
$checksum64     = 'b50a756655a846f8f59f9e4a69bc5cc361aa82f6c094098efed9f567db7deedf'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\kompose.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Remove tools sub-folders (previous package installations)
$subdirs = Get-ChildItem "$toolsDir" -Directory
foreach ($subdir in $subdirs) {
    Remove-Item "$toolsDir\$subdir" -Recurse
}
